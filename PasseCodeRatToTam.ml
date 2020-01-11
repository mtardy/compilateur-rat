(* Module de la passe de génération de code *)
module PasseCodeRatToTam : Passe.Passe with type t1 = Ast.AstPlacement.programme and type t2 = string =
struct

  open Tds
  open Type
  open Exceptions
  open Ast
  open Code
  open AstType

  type t1 = Ast.AstPlacement.programme
  type t2 = string

(* analyse_affectable : AstPlacement.affectable -> string *)
(* Paramètre a : l'affectable dont on veut générer le code *)
(* Paramètre instruction : l'instruction STORE ou LOAD en fonction de si l'on veut
respectivement faire une ecriture ou une lecture d'un affectable *)
(* Génère le code d'un affectable *)
(* Cette fonction est complexe car elle factorise le comportement en lecture
et en écriture des affectables *)
let analyse_affectable a instruction =
  (* La fonction auxiliaire permet uniquement de renvoyer une string au lieu d'un couple *)
  let rec aux a instruction =
    match a with
      | Ident(info_ast) ->
        let typ = getType info_ast in
        (* Si on a affaire à un identifiant classique, qu'il s'agisse d'un pointeur
        ou non, on veut faire un LOAD ou un STORE en fonction de lecture ou écriture *)
        (typ, instruction^" (" ^(string_of_int (getTaille (getType info_ast)))^") "^(string_of_int (getAddr info_ast))^"["^(getReg info_ast)^"]\n")
      | Valeur(a) ->
        (* Si on a affaire à un pointeur accédé avec une étoile, on va nécessairement
        charger son adresse du tas dans la pile (avec un LOAD) pour poursuivre et
        faire une opération de STOREI pour une écriture ou un LOADI pour une lecture *)
        let typ, s = (aux a "LOAD") in
        match typ with
        | Pointeur(ntyp) -> (ntyp, s^instruction^"I ("^(string_of_int( getTaille (ntyp)))^")\n")
        | _ -> raise (ErreurInterne)
  in snd (aux a instruction)


(* On transforme une string en liste *)
let explode s =
  let rec exp i l =
    if i < 0 then l
    else exp (i - 1) ((Char.escaped s.[i]) :: l) in
  exp (String.length s - 1) [];;

(* On load chaque caractères -> À remplacer par un fold *)
let rec load_chaine l = match l with
    |[] -> ""
    |h::t -> "LOADL '"^h^"'\n"^(load_chaine t)

(* analyse_expression : AstPlacement.expression -> string *)
(* Paramètre e : l'expression dont on veut générer le code *)
(* Analyse l'expression et génère le code TAM correspondant *)
let rec analyse_expression e =
  match e with
  | True -> "LOADL 1\n"
  | False -> "LOADL 0\n"
  | Entier(i) -> "LOADL "^(string_of_int i)^"\n"
  | Chaine(c) ->
      let l = (explode c) in
      (* Argument du MAlloc (taille du bloc) : len(chaine) + 1 (pour la taille) *)
      "LOADL "^(string_of_int ((List.length l)+1))^"\n"
      (* MAlloc réserve la place *)
      (* L'adresse est placé dans la pile *)
      ^"SUBR MAlloc\n"^
      (* On place la liste de caractere et la taille dans la pile*)
      "LOADL "^(string_of_int (List.length l))^"\n"^
      (* On charge chaque caractère dans la pile *)
      load_chaine l
      (* On récupère l'adresse renvoyée par MAlloc et on la place en haut de la pile *)
      ^"LOAD (1) -"^(string_of_int ((List.length l)+2))^"[ST]\n"
      (* On place la chaine dans le tas *)
      ^"STOREI ("^(string_of_int ((List.length l)+1))^")\n"
      (* La haut de la pile est égal à l'adresse de la string *)
  | SousChaine(e, e1, e2) ->
    (analyse_expression e)
    ^(analyse_expression e1)
    ^(analyse_expression e2)
    ^"CALL (SB) SSub\n"
  (* La taille d'une chaîne de caractère est le premier élément de la structure dans le tas *)
  | Taille(e) ->
    (analyse_expression e)
    ^"LOADI (1)"
  (* On analyse chaque expression du rationnel *)
  | Rationnel(e1, e2) ->
    (analyse_expression e1)
    ^(analyse_expression e2)
  (* On charge le rationnel et on POP le dénominteur *)
  | Numerateur(e) ->
    (analyse_expression e)
    ^"POP (0) 1\n"
  (* On charge le rationnel et on POP le numérateur *)
  | Denominateur(e) ->
    (analyse_expression e)
    ^"POP (1) 1\n"
  (* Analyse des expression du binaire puis appel de l'opérateur TAM ou de la fonction *)
  | Binaire(op, e1, e2) ->
    (analyse_expression e1)
    ^(analyse_expression e2)
    ^(
      begin
        match op with
        | PlusInt -> "SUBR IAdd\n"
        | PlusRat -> "CALL (SB) RAdd\n"
        | MultInt -> "SUBR IMul\n"
        | MultRat -> "CALL (SB) RMul\n"
        | EquInt -> "SUBR IEq\n"
        (* On traite les booléens comme des entiers *)
        | EquBool -> "SUBR IEq\n"
        | Inf -> "SUBR ILss\n"
        | Concat -> "CALL (SB) SCat\n"
      end
    )
  | AppelFonction(info_ast, le) ->
    (* Générer le code des expressions des paramètres *)
    List.fold_right (fun e q -> (analyse_expression e)^q) le ""
    ^"CALL (SB) "^(getFunNom info_ast)^"\n"
  (* Faire un MAlloc de taille adéquate *)
  | New(typ) ->
    "LOADL "^(string_of_int (getTaille typ))^"\n"
    ^"SUBR MAlloc\n"
  | Null ->
    "SUBR MVoid\n"
  (* On analyse l'affectable en lecture *)
  | Acces(a) ->
    (analyse_affectable a "LOAD")
  (* On charge l'adresse de l'info sur la pile *)
  | Adresse(info_ast) ->
    "LOADL "^(string_of_int (getAddr info_ast))^"\n"

  let taille_i i = match i with
    |Declaration(e,info) -> getTaille (getType info)
    |_ -> 0

  (* Renvoie la taille utilisé par une liste d'instruction dans la pile *)
  let taille_li li = List.fold_left (fun result instruction -> (taille_i instruction) + result) 0 li

  (* analyse_instruction : AstPlacement.instruction -> string *)
  (* Paramètre i : l'instruction dont on veut générer le code *)
  (* Analyse l'instruction et génère le code TAM correspondant *)
  let rec analyse_instruction i = match i with
    | Empty -> ""
    | Declaration(e,info) ->
      (* On PUSH la taille utilisée puis on STORE la valeur *)
      let taille = string_of_int (getTaille (getType info)) in
      "PUSH "^taille^"\n"
      ^(analyse_expression e)
      ^"STORE ("^taille^") "^(string_of_int (getAddr info))^"["^(getReg info)^"]\n"
    | Affectation(a, e) ->
      (* On STORE la valeur affectée à la variable dans la pile *)
      (analyse_expression e)^
      (analyse_affectable a "STORE")
    | Conditionnelle(e,bt,be) ->
      (* Génération de deux étiquettes *)
      let etiElse = getEtiquette () in
      let etiFinIf = getEtiquette () in
      (* Condition *)
      (analyse_expression e)
      (* Bloc if *)
      ^"JUMPIF (0) "^etiElse^"\n"
      ^(analyse_bloc bt)
      ^"JUMP "^etiFinIf^"\n"
      (* Bloc else *)
      ^etiElse^"\n"
      ^(analyse_bloc be)
      ^etiFinIf^"\n"
    | TantQue(e, b) ->
      (* Génération de deux étiquettes *)
      let debutTQ = getEtiquette () in
      let finTQ = getEtiquette () in
      debutTQ^"\n"
      (* Condition *)
      ^(analyse_expression e)
      (* Bloc du tant que *)
      ^"JUMPIF (0) "^finTQ^"\n"
      ^(analyse_bloc b)
      ^"JUMP "^debutTQ^"\n"
      ^finTQ^"\n"
    | AffichageInt(e) ->
      (analyse_expression e)
      ^"SUBR IOut\n"
    | AffichageBool(e) ->
      (analyse_expression e)
      ^"SUBR BOut\n"
    | AffichageRat(e) ->
      (analyse_expression e)
      ^"CALL (SB) ROut\n"
    | AffichageStr(e) ->
      (analyse_expression e)
      ^"CALL (SB) SOut\n"

  (* analyse_bloc : AstPlacement.instruction -> string *)
  (* Paramètre li : liste des instructions dont on veut générer le code *)
  (* Analyse le bloc d'instructions et génère le code TAM correspondant *)
  and analyse_bloc li =
    (List.fold_right (fun elem myString -> (analyse_instruction elem)^myString) li "")
    (* Inutile de POP les déclarations locales du bloc main car la fin du bloc main signifie
    la fin du programme *)

  (* analyse_fonction : AstPlacement.fonction -> string *)
  (* Paramètre f : fonction dont on veut générer le code *)
  (* Analyse la fonction et génère le code TAM correspondant *)
  let analyse_fonction f =
    match f with
    (* Il n'y a pas de code correspondant au prototype *)
    | AstPlacement.Prototype -> ""
    | Ast.AstPlacement.Fonction(info_ast, linfo_ast, li, e) ->
      let tailleToPop = (taille_li li) in
      getFunNom info_ast^"\n"
      (* bloc d'instructions de la fonction *)
      ^(analyse_bloc li)
      (* expression de retour de la fonction *)
      ^(analyse_expression e)
      ^(let tailleRetour = getTaille (getType info_ast) in
        "RETURN ("^(string_of_int tailleRetour)^") "^(string_of_int (getTailleParam info_ast))^"\n")
      ^(
      (* POP les déclarations locales du bloc d'une fonction *)
      if (tailleToPop > 0) then
        "POP (0) "^(string_of_int tailleToPop)^"\n\n"
      (* Ne pas inscrire l'instruction inutile "POP (0) 0" *)
      else
        "\n"
      )

  (* analyse : AstPlacement.Programme -> string *)
  (* Paramètre : programme dont on veut générer le code *)
  (* Analyse le programme et génère le code TAM correspondant *)
  let analyser (Ast.AstPlacement.Programme(fonctions, bloc)) =
    let nfonctions = List.map analyse_fonction fonctions in
    let nbloc = analyse_bloc bloc in
    let code =
    (Code.getEntete ())
    ^(List.fold_right (fun elem myString -> elem^myString) nfonctions "")
    ^"\nmain\n"
    ^nbloc
    ^"HALT" in
    Code.ecrireFichier "FichierOutput.tam" code;
    code
end