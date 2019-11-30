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

(* analyse_expression : AstPlacement.expression -> string *)
(* Paramètre e : l'expression dont on veut générer le code *)
(* Analyse l'expression et génère le code TAM correspondant *)
let rec analyse_expression e =
  match e with
  | True -> "LOADL 1\n"
  | False -> "LOADL 0\n"
  | Entier(i) -> "LOADL "^(string_of_int i)^"\n"
  (* On récupère la taille du type lié à l'identifiant et son adresse *)
  | Ident(info_ast) ->
    "LOAD ("^(string_of_int (getTaille (getType info_ast)))^") "^(string_of_int (getAddr info_ast))^"["^(getReg info_ast)^"]\n"
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
        | EquBool -> "SUBR BAnd\n"
        | Inf -> "SUBR ILss\n"
      end
    )
  | AppelFonction(info_ast, le) ->
    List.fold_right (fun e q -> (analyse_expression e)^q) le ""
    ^"CALL (SB) "^(getFunNom info_ast)^"\n"

  let taille_i i = match i with
    |Declaration(e,info) -> getTaille (getType info)
    |_ -> 0

  let taille_li li = List.fold_left (fun result instruction -> (taille_i instruction) + result) 0 li

  let rec analyse_instruction i = match i with
    | Empty -> ""
    | Declaration(e,info) ->
      (* On PUSH la taille utilisée puis on STORE la valeur *)
      let taille = string_of_int (getTaille (getType info)) in
      "PUSH "^taille^"\n"
      ^(analyse_expression e)
      ^"STORE ("^taille^") "^(string_of_int (getAddr info))^"["^(getReg info)^"]\n"
    | Affectation(e, info) ->
      (* On STORE la valeur affectée à la variable dans la pile *)
      (analyse_expression e)
      ^"STORE ("^string_of_int (getTaille (getType info))^") "^(string_of_int (getAddr info))^"["^(getReg info)^"]\n"
    | Conditionnelle(e,bt,be) ->
      (* Génération de deux étiquettes *)
      let etiElse = getEtiquette () in
      let etiFinIf = getEtiquette () in
      (analyse_expression e)
      ^"JUMPIF (0) "^etiElse^"\n"
      ^(analyse_bloc bt)
      ^"JUMP "^etiFinIf^"\n"
      ^etiElse^"\n"
      ^(analyse_bloc be)
      ^etiFinIf^"\n"
    | TantQue(e, b) ->
      (* Génération de deux étiquettes *)
      let debutTQ = getEtiquette () in
      let finTQ = getEtiquette () in
      debutTQ^"\n"
      ^(analyse_expression e)
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

  and analyse_bloc li =
    let tailleToPop = (taille_li li) in
    (List.fold_right (fun elem myString -> (analyse_instruction elem)^myString) li "")
    ^(
    (* POP les déclarations locales du bloc *)
    if (tailleToPop > 0) then
      "POP (0) "^(string_of_int tailleToPop)^"\n"
    (* Ne pas inscrire l'instruction inutile "POP (0) 0" *)
    else
      ""
    )

  let analyse_fonction (Ast.AstPlacement.Fonction(info_ast, linfo_ast, li, e)) =
    getFunNom info_ast^"\n"
    ^(analyse_bloc li)
    ^(analyse_expression e)
    ^(let tailleRetour = getTaille (getType info_ast) in
      "RETURN (1) "^(string_of_int tailleRetour)^"\n")

  let analyser (Ast.AstPlacement.Programme(fonctions, bloc)) =
    let nfonctions = List.map analyse_fonction fonctions in
    let nbloc = analyse_bloc bloc in
    let code =
    (Code.getEntete ())
    ^(List.fold_right (fun elem myString -> elem^myString) nfonctions "")
    ^"\nmain\n"
    ^nbloc
    ^"HALT\n" in
    Code.ecrireFichier "FichierOutput.tam" code;
    code
end