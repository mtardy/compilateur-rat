(* Module de la passe de typage *)
module PasseTypeRat : Passe.Passe with type t1 = Ast.AstTds.programme and type t2 = Ast.AstType.programme =
struct

  open Tds
  open Type
  open Exceptions
  open Ast
  open AstType

  type t1 = Ast.AstTds.programme
  type t2 = Ast.AstType.programme

  let analyse_fonctions lf =
    failwith "todo"

  let rec analyse_expression e =
    match e with
    | AstTds.True -> (True, Bool)
    | AstTds.False -> (False, Bool)
    | AstTds.Entier(a) -> (Entier(a), Int)
    | AstTds.Ident info_ast ->
      (Ident(info_ast), getType info_ast)
    | AstTds.Numerateur(e) ->
      begin
        let (ne, te) = analyse_expression e in
        if (est_compatible te Int) then
          (Numerateur(ne), Int)
        else
          raise (TypeInattendu (te,Int))
      end
    | AstTds.Denominateur(e) ->
      begin
        let (ne, te) = analyse_expression e in
        if (est_compatible te Int) then
          (Denominateur(ne), Int)
        else
          raise (TypeInattendu (te, Int))
      end
    | AstTds.Rationnel(e1, e2) ->
      begin
        let (ne1, te1) = analyse_expression e1 in
        let (ne2, te2) = analyse_expression e2 in
        if (est_compatible te1 Int && est_compatible te2 Int) then
          (Rationnel(ne1, ne2), Rat)
        else if not (est_compatible te1 Int) then
          raise (TypeInattendu (te1, Int))
        else if not (est_compatible te2 Int) then
          raise (TypeInattendu (te2, Int))
        else 
          raise (ErreurInterne)
      end
    | AppelFonction(le, info_ast) ->
      failwith "todo"
    | _ ->
      failwith "ok"


  let rec analyse_instructions i =
    match i with
    (* On vérifie si le type de la déclaration correspond au type de l'expression *)
    | AstTds.Declaration(t, e, info_ast) ->
      begin
        let (ne, te) = analyse_expression e in
          if est_compatible t te then
            begin
            modifier_type_info t info_ast;
            Declaration(ne, info_ast)
            end
          else
            raise (TypeInattendu (t, te))
      end
    (* On vérifie si l'affectation est possible, ie. le type retournée par l'expression
    correspond au type de la variable dans laquelle on l'affecte *)
    | AstTds.Affectation(e, info_ast) ->
      begin
        let (ne, te) = analyse_expression e in
        let t = getType info_ast in
          if est_compatible te t then
            Affectation(ne, info_ast)
          else
            raise (TypeInattendu (t, te))
      end
    | AstTds.Affichage(e) ->
      begin
        let (ne, te) = analyse_expression e in
          match te with
          | Int -> AffichageInt(ne)
          | Rat -> AffichageRat(ne)
          | Bool -> AffichageBool(ne)
          | Undefined ->
            raise (ErreurInterne)
      end
    | AstTds.Conditionnelle(e, bt, be) ->
      let (ne, te) = analyse_expression e in
      begin
        if (te = Bool) then
          let nbt = analyse_bloc bt in
          let nbe = analyse_bloc be in
          Conditionnelle(ne, nbt, nbe)
        else
          raise (TypeInattendu (te, Bool))
      end
    | AstTds.TantQue(e, b) ->
      let (ne, te) = analyse_expression e in
      begin
        if (te = Bool) then
          let nb = analyse_bloc b in
          TantQue(ne, nb)
        else
          raise (TypeInattendu (te, Bool))
      end
    | AstTds.Empty ->
      Empty



  and analyse_bloc li =
    let nli = List.map analyse_instructions li in
    (* afficher_locale tdsBloc; *)
    nli

  let analyser (AstTds.Programme(fonctions, bloc)) =
    let nfonctions = List.map analyse_fonctions fonctions in
    let nbloc = analyse_bloc bloc in
    Programme(nfonctions, nbloc)

end