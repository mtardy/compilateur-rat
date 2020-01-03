(* Module de la passe de placement mémoire *)
module PassePlacementRat : Passe.Passe with type t1 = Ast.AstType.programme and type t2 = Ast.AstPlacement.programme =
struct

  open Tds
  open Type
  open Exceptions
  open Ast
  open AstPlacement

  type t1 = Ast.AstType.programme
  type t2 = Ast.AstPlacement.programme

  (* analyse_instruction : int -> string -> AstType.instruction -> int * AstType.instruction *)
  (* Paramètre dep : le déplacement du placement mémoire *)
  (* Paramètre reg : le registre courant *)
  (* Paramètre i : l'instruction pour laquelle réaliser le placement mémoire *)
  (* Effectue le placement mémoire pour une instruction *)
  let rec analyse_instruction dep reg i =
    match i with
    (* Placer la taille mémoire nécessaire au placement de la déclaration 
    et se décaler dans le placement de la suite *)
    | AstType.Declaration(e, info_ast) ->
      let typ = (getType info_ast) in 
      let t = getTaille typ in
      modifier_adresse_info dep reg info_ast;
      (t+dep, AstType.Declaration(e, info_ast))
    (* Ici pas besoin dans se décaler par la suite car les déclarations
    du bloc seront locales *)
    | AstType.TantQue(e, b) ->
      let nb = analyse_bloc dep reg b in
      (dep, AstType.TantQue(e, nb))
    (* Ici pas besoin non plus dans se décaler par la suite car les déclarations
    du bloc seront aussi locales *)
    | AstType.Conditionnelle(e, bt, be) ->
      let nbt = analyse_bloc dep reg bt in
      let nbe = analyse_bloc dep reg be in
      (dep, AstType.Conditionnelle(e, nbt, nbe))
    (* Pour les autres instructions, pas besoin de placement mémoire *)
    | _ ->
      (dep, i)

  (* analyse_bloc : int -> string -> Rat.Ast.AstType.bloc -> Rat.Ast.AstType.bloc *)
  (* Paramètre dep : le déplacement du placement mémoire *)
  (* Paramètre reg : le registre concerné par le bloc *)
  (* Paramètre li : la liste des instructions du bloc *)
  (* Effectue le placement mémoire pour les instructions du bloc *)
  and analyse_bloc dep reg li =
    match li with
    | [] -> []
    | i::q ->
      let (ndep, ni) = analyse_instruction dep reg i in
      ni::(analyse_bloc ndep reg q)

  (* analyse_param : Tds.info_ast list -> int -> 'a list *)
  (* Paramètre revlp : la liste des paramètres inversée *)
  (* Paramètre dep : le déplacement du placement mémoire *)
  (* Effectue le placement mémoire pour les paramètres passés dans la
  fonction en fonction de leur taille mémoire *)
  let rec analyse_param revlp dep =
    match revlp with
    | [] -> ()
    | info_ast::q ->
      let t = getTaille (getType info_ast) in
      (* On ajoute paramètres "en négatif" par rapport à LB *)
      modifier_adresse_info (dep-t) "LB" info_ast;
      analyse_param q (dep-t)

  (* analyse_fonction : AstType.fonction -> AstPlacement.fonction *)
  (* Paramètre : la fonction à analyser *)
  (* Effectue le placement mémoire pour les paramètres passés dans la
  fonction et pour le bloc d'instruction de la fonction *)
  let analyse_fonction f = 
    match f with
    | AstType.Fonction(info_ast, lp, li, e) ->
    (* L'analyse de paramètres n'effectue que des effets de bords *)
    analyse_param (List.rev lp) 0;
    (* Analyse du bloc en partant de 3 "LB" car nous sommes dans une fonction *)
    let nli = analyse_bloc 3 "LB" li in
    Fonction(info_ast, lp, nli, e)
    | AstType.Prototype(infoMultiFun_ast, ltyp) ->
      begin
      (* On récupère la liste de couple (infoFun * liste params) dans l'infoMultiFun *)
      let type_param = getTypeParam infoMultiFun_ast in
      (* On analyse si la fonction est déjà déclaré avec les mêmes types de paramètre *)
      match (est_compatible_fun ltyp type_param) with
        | None ->
          failwith "Erreur interne: cette erreur aurait dû être levée dans la phase de typage."
        | Some info_ast ->
          begin
          match info_ast_to_info info_ast with
          | InfoFun(n,t,lt,b) ->
            begin
            if (not b) then
              (* Les fonctions possèdent une étiquette pour la surcharge qu'on élimine 
              lors de l'affichage de l'erreur *)
              raise (CorpsFonctionManquant (List.hd (String.split_on_char '#' n)))
            else
              Prototype
            end
          | _ -> failwith "Erreur interne: les info de prototypes sont des InfoFun."
          end
        end


  (* analyser : AstType.programme -> AstPlacement.programme*)
  (* Paramètre : le programme à analyser *)
  (* Réalise le placement mémoire pour les fonctions et la
  liste d'instruction du programme *)
  let analyser (AstType.Programme(lf, li)) =
    (* Analyse de chaque fonctions *)
    let nlf = List.map analyse_fonction lf in
    (* Analyse du bloc principale du programme, on part de 0[SB] *)
    let nli = analyse_bloc 0 "SB" li in
    Programme(nlf, nli)

end