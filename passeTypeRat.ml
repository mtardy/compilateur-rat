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

  let rec analyse_affectable a =
    match a with
    | AstTds.Ident info_ast ->
      (Ident(info_ast), getType info_ast)
    | AstTds.Valeur aff ->
      let ana_aff = analyse_affectable aff in
      begin
      match (snd ana_aff) with
        | Pointeur(t) -> (Valeur(fst ana_aff), t)
        | t -> raise (TypeInattendu(t, Pointeur(t)))
      end
  

  (* analyse_expression : Rat.Ast.AstTds.expression -> Rat.Ast.AstType.expression * Rat.Type.typ *)
  (* Paramètre e : l'expression à analyser *)
  (* Vérifie que le typage est correct dans l'expression et renvoie un couple
  composé d'une AstType.expression et d'un type *)
  (* Erreur si l'utilisation des types est incorrect *)
  let rec analyse_expression e =
    match e with
    (* On verifie que l'ont a bien une string et deux int *)
    | AstTds.SousChaine(e,e1,e2) ->
      begin
        let (ne,te) = analyse_expression e in
        let (ne1,te1) = analyse_expression e1 in
        let (ne2,te2) = analyse_expression e2 in
        if (est_compatible te Str) then
          begin
          if (est_compatible te1 Int && est_compatible te2 Int) then
            (SousChaine(ne,ne1,ne2), Str)
          else if (not (est_compatible te1 Int)) then
            raise (TypeInattendu (te1, Int))
          else
            raise (TypeInattendu (te2, Int))
          end
        else 
          raise (TypeInattendu (te, Str))
      end
    | AstTds.True -> (True, Bool)
    | AstTds.False -> (False, Bool)
    | AstTds.Entier(a) -> (Entier(a), Int)
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
      (* Verifie que l'on prend bien une string en argument *)
    | AstTds.Taille(e) -> 
      let (ne,te) = analyse_expression e in
      begin 
      if (est_compatible te Str) then
        (Taille(ne), Int)
      else 
        raise (TypeInattendu (te, Str))
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
    | AstTds.AppelFonction(infoFun_ast, le) ->
      begin
      (* On recupere les type et info des arguments*)
      let type_param = getTypeParam infoFun_ast in
      (* On garde la liste des liste de type des parametre (surcharge) *)
      let (lltyp,_) = List.split type_param in
      (* Analyse de l'expression *)
      let nle = List.map analyse_expression le in
      (* On recupere la liste de type et la liste de nouvelle expr *)
      let (lnle, ltype) = List.split nle in
      (* On cherche une fonction avec la liste de type correspondant *)
      (* C'est ici que pose probleme la surcharge du type de retour :
      il nous faudrait retourner une liste de type possible de l'expression *)
      match (est_compatible_fun ltype type_param) with
        (* On a trouvé une infoFun correspondante *)
        | Some info -> ((AppelFonction(info, lnle), getType info))
        (* Pas de fonction declaré avec cette liste de type *)
        | None -> raise (TypesParametresInattendus (ltype,lltyp))
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
        | Str, AstSyntax.Concat, Str -> Binaire(Concat, ne1, ne2), Str
        | _ ->
          raise (TypeBinaireInattendu (op, te1, te2))
      end
    | AstTds.Chaine(a) ->  (Chaine(a), Str)
    | AstTds.New(typ) -> (New(typ), Pointeur(typ))
    | AstTds.Adresse(info_ast) ->
      (Adresse(info_ast), Pointeur(getType info_ast))
    | AstTds.Acces(a) ->
      let (na, ta) = analyse_affectable a in
      (Acces(na), ta)
    | AstTds.Null -> (Null, Pointeur(Undefined))

  (* analyser_instruction : AstTds.instruction -> AstType.instruction *)
  (* Paramètre : l'instruction à analyser *)
  (* Analyse le typage d'une instruction *)
  (* Erreur si mauvaise utilisation des types *)
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
    | AstTds.Affectation (a, e) ->
      let (na, ta) = analyse_affectable a in
      let (ne, te) = analyse_expression e in
      begin
      if est_compatible ta te then
        (Affectation(na, ne))
      else
        raise (TypeInattendu (te, ta))
      end
    (* On retourne des affichages plus spécifiques à chaque types *)
    | AstTds.Affichage(e) ->
      begin
        let (ne, te) = analyse_expression e in
          match te with
          | Int -> AffichageInt(ne)
          | Rat -> AffichageRat(ne)
          | Bool -> AffichageBool(ne)
          | Str -> AffichageStr(ne)
          | Undefined ->
            raise (ErreurInterne)
          | Pointeur(_) -> AffichageInt(ne)
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

  (* analyser_bloc : AstTds.bloc -> AstType.bloc *)
  (* Paramètre : le bloc d'instruction à analyser *)
  (* Analyse le typage des instructions d'un bloc *)
  (* Erreur si mauvaise utilisation des types *)
  and analyse_bloc li =
    (* L'analyse d'un bloc consite à l'analyse de chacune de ses instructions *)
    let nli = List.map analyse_instruction li in
    nli

  (* analyser_fonction : AstTds.fonction -> AstType.fonction *)
  (* Paramètre : la fonction à analyser *)
  (* Ajoute dans l'info le type de la fonction et de ses paramètres,
  analyse ensuite le bon typage des instructions au sein de la fonction
  puis vérifie que le typage de l'expression retournée est cohérent *)
  (* Erreur si mauvaise utilisation des types *)
  let analyse_fonction f = 
    match f with
      |(AstTds.Fonction(typ, infoMultiFun_ast, infoListArgs, li, e)) ->
        begin
        (* On récupere la liste d'infos et de types de la fonction analysée *)
        let (ltyp, linfo_ast) = List.split infoListArgs in
        (* On récupère la liste de couple (infoFun * liste params) dans l'infoMultiFun *)
        let type_param = getTypeParam infoMultiFun_ast in
        (* On analyse si la fonction est déjà déclaré avec les mêmes types de paramètre *)
        match (est_compatible_fun ltyp type_param) with
          | None ->
            begin
            let newInfoFun = ajouterTypeParamFun ltyp infoMultiFun_ast typ true in
            List.iter (fun (typ,info) -> modifier_type_info typ info) infoListArgs;
            (* Analyse instructions *)
            let nli = List.map analyse_instruction li in
            (* Analyse du retour *)
            let (ne,te) = analyse_expression e in
            (* On vérifie que le type de retour concorde au type de la fonction *)
            if est_compatible typ te then
              Fonction(newInfoFun, linfo_ast, nli, ne)
            else
              raise (TypeInattendu(te,typ))
            end
          | Some info ->
            begin
            (* On regarde pour le type de retour *)
            (* Si le type de retour correspond, on verifie que la declaration precedente est un prototype*)
            if est_compatible typ (getType info) then
              begin
              match (info_ast_to_info info) with
              | InfoFun(n,t,lt,b) -> 
                (* Si b = false, la declaration est protoypé *)
                if (not b) then
                  begin
                  (* On indique que la fonction possede un corps *)
                  modifier_bol_infoFun info true;
                  List.iter (fun (typ,info) -> modifier_type_info typ info) infoListArgs;
                  let nli = List.map analyse_instruction li in
                  let (ne,te) = analyse_expression e in
                  (* On vérifie que le type de retour concorde au type de la fonction *)
                  if est_compatible typ te then
                    Fonction(info, linfo_ast, nli, ne)
                  else
                    raise (TypeInattendu(te,typ))
                  end
                (* Sinon, double declaration *)
                else
                  raise (DoubleDeclaration (getFunNom infoMultiFun_ast))
              | _ -> failwith "ErreurInterne"
              end  
            else
              (* Le type de retour ne correspond pas à la declaration précédente *)
              raise (SurchargeTypeRetour (List.hd (String.split_on_char '#' (getFunNom info))))
            end
        end
      | AstTds.Prototype(typ, infoMultiFun, ltyp) ->
        begin
        (* On récupère la liste de couple (infoFun * liste params) dans l'infoMultiFun *)
        let type_param = getTypeParam infoMultiFun in
        (* On analyse si la fonction est déjà déclaré avec les mêmes types de paramètre *)
        match (est_compatible_fun ltyp type_param) with
          (* Si ce n'est pas la cas, on ajoute a l'info multiFun cette fonction *)
          | None ->
            let _ = ajouterTypeParamFun ltyp infoMultiFun typ false in
            (* Nous n'avons plus besoin d'information du Prototype après *)
            Prototype(infoMultiFun, ltyp)
          | Some info -> 
          (* On regarde si le type de retour correspond à la déclaration précédente *)
          if est_compatible typ (getType info) then
            (* On a deja declaré la fonction avant -> proto inutile ou double proto *)
            raise (DoubleDeclaration (getFunNom infoMultiFun))
          else
            (* On a une fonction de meme parametre mais avec un type de retour différent :
            surcharge du type de retour *)
            raise (SurchargeTypeRetour (List.hd (String.split_on_char '#' (getFunNom info))))
        end
          

  (* analyser : AstTds.ast -> AstType.ast *)
  (* Paramètre : le programme à analyser *)
  (* Vérifie que le typage est correct dans le programme *)
  (* Erreur si mauvaise utilisation des types *)
  let analyser (AstTds.Programme(fonctions1, bloc, fonctions2)) =
    let nfonctions1 = List.map analyse_fonction fonctions1 in
    let nbloc = analyse_bloc bloc in
    let nfonctions2 = List.map analyse_fonction fonctions2 in
    (* À partir de cette passe, il n'est plus nécessaire de faire une distinction entre
    le code situé avant et après le bloc principal, on les concatene *)
    Programme(nfonctions1@nfonctions2, nbloc)

end
