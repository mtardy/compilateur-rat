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

  (* analyse_expression : Rat.Ast.AstTds.expression -> Rat.Ast.AstType.expression * Rat.Type.typ *)
  (* Paramètre e : l'expression à analyser *)
  (* Vérifie que le typage est correct dans l'expression et renvoie un couple
  composé d'une AstType.expression et d'un type *)
  (* Erreur si l'utilisation des types est incorrect *)
  let rec analyse_expression e =
    match e with
    | AstTds.True -> (True, Bool)
    | AstTds.False -> (False, Bool)
    | AstTds.Entier(a) -> (Entier(a), Int)
    | AstTds.Ident info_ast ->
      (Ident(info_ast), getType info_ast)
    (* Vérifie que le type est bien un rationnel *)
    | AstTds.Numerateur(e) ->
      begin
        let (ne, te) = analyse_expression e in
        if (est_compatible te Rat) then
          (Numerateur(ne), Int)
        else
          raise (TypeInattendu (te, Rat))
      end
    (* Vérifie que le type est bien un rationnel *)
    | AstTds.Denominateur(e) ->
      begin
        let (ne, te) = analyse_expression e in
        if (est_compatible te Rat) then
          (Denominateur(ne), Int)
        else
          raise (TypeInattendu (te, Rat))
      end
    (* Vérifie que le type est bien construit à partir de deux entiers *)
    | AstTds.Rationnel(e1, e2) ->
      begin
        let (ne1, te1) = analyse_expression e1 in
        let (ne2, te2) = analyse_expression e2 in
        if (est_compatible te1 Int && est_compatible te2 Int) then
          (Rationnel(ne1, ne2), Rat)
        (* Permet de cibler l'exception sur le bon argument *)
        else if not (est_compatible te1 Int) then
          raise (TypeInattendu (te1, Int))
        else if not (est_compatible te2 Int) then
          raise (TypeInattendu (te2, Int))
        else
        (* Code mort si tout va bien *)
          raise (ErreurInterne)
      end
    (* Vérifie que l'appel de la fonction se fait avec des paramètres de types corrects *)
    | AstTds.AppelFonction(info_ast, le) ->
      begin
      let type_param = getTypeParam info_ast in
      let nle = List.map analyse_expression le in
      let (lnle, ltype) = List.split nle in
      if (est_compatible_list type_param ltype) then
        ((AppelFonction(info_ast, lnle), getType info_ast))
      else
        raise (TypesParametresInattendus (ltype,type_param))
      end
    (* Vérifie que l'opération binaire est possible *)
    | AstTds.Binaire(op, e1, e2) ->
      begin
        let (ne1, te1) = analyse_expression e1 in
        let (ne2, te2) = analyse_expression e2 in
        match te1, op, te2 with
        | Int, AstSyntax.Plus, Int -> Binaire(PlusInt, ne1, ne2), Int
        | Rat, AstSyntax.Plus, Rat -> Binaire(PlusRat, ne1, ne2), Rat
        | Int, AstSyntax.Mult, Int -> Binaire(MultInt, ne1, ne2), Int
        | Rat, AstSyntax.Mult, Rat -> Binaire(MultRat, ne1, ne2), Rat
        | Int, AstSyntax.Equ, Int -> Binaire(EquInt, ne1, ne2), Bool
        | Bool, AstSyntax.Equ, Bool -> Binaire(EquBool, ne1, ne2), Bool
        | Int, AstSyntax.Inf, Int -> Binaire(Inf, ne1, ne2), Bool
        | _ ->
          raise (TypeBinaireInattendu (op, te1, te2))
      end


  let rec analyse_instruction i =
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
            raise (TypeInattendu (te, t))
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
            raise (TypeInattendu (te, t))
      end
    (* On retourne des affichages plus spécifiques à chaque types *)
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
    (* On analyse les deux blocs de la condition et l'expression *)
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
    (* On analyse le bloc et l'expression *)
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
    (* L'analyse d'un bloc consite à l'analyse de chacune de ses instructions *)
    let nli = List.map analyse_instruction li in
    nli


  let analyse_fonction (AstTds.Fonction(typ, infoFun_ast, infoListArgs, li, e)) = (*infolist couple*)
    (* On récupere la liste d'infos et de types *)
    let (ltyp, linfo_ast) = List.split infoListArgs in
    (* On modifie infoFun en conséquence *)
    modifier_type_fonction_info typ ltyp infoFun_ast;
    List.iter (fun (typ,info) -> modifier_type_info typ info) infoListArgs;
    (* Analyse instructions *)
    let nli = List.map analyse_instruction li in
    (* Analyse du retour *)
    let (ne,te) = analyse_expression e in
    (* On vérifie que le type de retour concorde au type de la fonction *)
      if est_compatible typ te then
        Fonction(infoFun_ast, linfo_ast, nli, ne)
      else
        raise (TypeInattendu(te,typ))


  let analyser (AstTds.Programme(fonctions, bloc)) =
    let nfonctions = List.map analyse_fonction fonctions in
    let nbloc = analyse_bloc bloc in
    Programme(nfonctions, nbloc)

end