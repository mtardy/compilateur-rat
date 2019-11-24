(* Module de la passe de gestion des identifiants *)
module PasseTdsRat : Passe.Passe with type t1 = Ast.AstSyntax.programme and type t2 = Ast.AstTds.programme =
struct

  open Tds
  open Exceptions
  open Ast
  open AstTds

  type t1 = Ast.AstSyntax.programme
  type t2 = Ast.AstTds.programme

(* analyse_tds_expression : AstSyntax.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_expression tds e =
  match e with
  | AstSyntax.AppelFonction (nom, lexpr)->
    begin
      (* Chercher si la fonction a été préalablement définie *)
      match chercherGlobalement tds nom with
        | None ->
            (* Appel fonction inexistante *)
            raise (IdentifiantNonDeclare nom)
        | Some info ->
          begin
            (* S'assurer que l'appel est bien fait sur un identifiant de fonction *)
            match (info_ast_to_info info) with
            | InfoFun(_) ->
              (* Transforme le nom en info *)
              let lexprTds = List.map (fun expr -> analyse_tds_expression tds expr) lexpr in
              AppelFonction(info, lexprTds)
            | _ ->
              raise (MauvaiseUtilisationIdentifiant nom)
          end
    end
  | AstSyntax.Rationnel (expr1, expr2) ->
      (* Analyser les sous expressions *)
      let expr1Tds = analyse_tds_expression tds expr1 in
      let expr2Tds = analyse_tds_expression tds expr2 in
      Rationnel(expr1Tds, expr2Tds)
  | AstSyntax.Numerateur (expr) ->
      let exprTds = analyse_tds_expression tds expr in
      Numerateur (exprTds)
  | AstSyntax.Denominateur (expr) ->
      let exprTds = analyse_tds_expression tds expr in
      Denominateur (exprTds)
  | AstSyntax.Ident (id) ->
    begin
      (* Chercher si l'identifiant a déjà été défini *)
      match chercherGlobalement tds id with
        | None ->
            raise (IdentifiantNonDeclare id)
        | Some infoId ->
            let info = info_ast_to_info infoId in
            begin
              match (info) with
              (* Un identifiant dans une expression ne peut pas être l'identifiant d'une fonction *)
              | InfoFun(_, _, _) -> raise (MauvaiseUtilisationIdentifiant id)
              | _ -> Ident(infoId)
            end
    end
  | AstSyntax.True -> True
  | AstSyntax.False -> False
  | AstSyntax.Entier (entier) ->
      Entier (entier)
  | AstSyntax.Binaire (op, expr1, expr2) ->
      (* Analyser les sous expressions *)
      let expr1Tds = analyse_tds_expression tds expr1 in
      let expr2Tds = analyse_tds_expression tds expr2 in
      Binaire(op, expr1Tds, expr2Tds)


(* analyse_tds_instruction : AstSyntax.instruction -> tds -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction
en une instruction de type AstTds.instruction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_instruction tds i =
  match i with
  | AstSyntax.Declaration (t, n, e) ->
      begin
        match chercherLocalement tds n with
        | None ->
            (* L'identifiant n'est pas trouvé dans la tds locale,
            il n'a donc pas été déclaré dans le bloc courant *)
            (* Vérification de la bonne utilisation des identifiants dans l'expression *)
            (* et obtention de l'expression transformée *)
            let ne = analyse_tds_expression tds e in
            (* Création de l'information associée à l'identfiant *)
            let info = InfoVar (n,Undefined, 0, "") in
            (* Création du pointeur sur l'information *)
            let ia = info_to_info_ast info in
            (* Ajout de l'information (pointeur) dans la tds *)
            ajouter tds n ia;
            (* Renvoie de la nouvelle déclaration où le nom a été remplacé par l'information
            et l'expression remplacée par l'expression issue de l'analyse *)
            Declaration (t, ne, ia)
        | Some _ ->
            (* L'identifiant est trouvé dans la tds locale,
            il a donc déjà été déclaré dans le bloc courant *)
            raise (DoubleDeclaration n)
      end
  | AstSyntax.Affectation (n,e) ->
      begin
        match chercherGlobalement tds n with
        | None ->
          (* L'identifiant n'est pas trouvé dans la tds globale. *)
          raise (IdentifiantNonDeclare n)
        | Some info ->
          (* L'identifiant est trouvé dans la tds globale,
          il a donc déjà été déclaré. L'information associée est récupérée. *)
          begin
            match info_ast_to_info info with
            | InfoVar _ ->
              (* Vérification de la bonne utilisation des identifiants dans l'expression *)
              (* et obtention de l'expression transformée *)
              let ne = analyse_tds_expression tds e in
              (* Renvoie de la nouvelle affectation où le nom a été remplacé par l'information
              et l'expression remplacée par l'expression issue de l'analyse *)
               Affectation (ne, info)
            |  _ ->
              (* Modification d'une constante ou d'une fonction *)
              raise (MauvaiseUtilisationIdentifiant n)
          end
      end
  | AstSyntax.Constante (n,v) ->
      begin
        match chercherLocalement tds n with
        | None ->
        (* L'identifiant n'est pas trouvé dans la tds locale,
        il n'a donc pas été déclaré dans le bloc courant *)
        (* Ajout dans la tds de la constante *)
        ajouter tds n (info_to_info_ast (InfoConst (n,v)));
        (* Suppression du noeud de déclaration des constantes devenu inutile *)
        Empty
        | Some _ ->
          (* L'identifiant est trouvé dans la tds locale,
          il a donc déjà été déclaré dans le bloc courant *)
          raise (DoubleDeclaration n)
      end
  | AstSyntax.Affichage e ->
      (* Vérification de la bonne utilisation des identifiants dans l'expression *)
      (* et obtention de l'expression transformée *)
      let ne = analyse_tds_expression tds e in
      (* Renvoie du nouvel affichage où l'expression remplacée par l'expression issue de l'analyse *)
      Affichage (ne)
  | AstSyntax.Conditionnelle (c,t,e) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc then *)
      let tast = analyse_tds_bloc tds t in
      (* Analyse du bloc else *)
      let east = analyse_tds_bloc tds e in
      (* Renvoie la nouvelle structure de la conditionnelle *)
      Conditionnelle (nc, tast, east)
  | AstSyntax.TantQue (c,b) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc *)
      let bast = analyse_tds_bloc tds b in
      (* Renvoie la nouvelle structure de la boucle *)
      TantQue (nc, bast)


(* analyse_tds_bloc : AstSyntax.bloc -> AstTds.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc
en un bloc de type AstTds.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and analyse_tds_bloc tds li =
  (* Entrée dans un nouveau bloc, donc création d'une nouvelle tds locale
  pointant sur la table du bloc parent *)
  let tdsBloc = creerTDSFille tds in
  (* Analyse des instructions du bloc avec la tds du nouveau bloc
  Cette tds est modifiée par effet de bord *)
  let nli = List.map (analyse_tds_instruction tdsBloc) li in
    (* afficher_locale tdsBloc; *)
    nli

(* analyse_args_function : Rat.Tds.tds -> 'a * string -> 'a * Rat.Tds.info_ast *)
(* Paramètre tds : la table des symboles de la fonction *)
(* Paramètre : le paramètre avec son type et son nom *)
(* Analyse un argument de la fonction et l'ajoute dans la tds locale de la fonction *)
(* Erreur si l'argument a déjà été déclaré *)
let rec analyse_args_function tds (typ,nom) =
  match chercherLocalement tds nom with
    | None -> let info = InfoVar (nom,Undefined, 0, "") in
              let info_ast = info_to_info_ast info in
              ajouter tds nom info_ast;
              (typ, info_ast)
    | Some _ -> raise (DoubleDeclaration nom)

(* ajouter_identifiant_fonction : Rat.Tds.tds -> string -> Rat.Tds.info_ast -> unit *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre nom : nom de la fonction *)
(* Paramètre infoFun_ast : le pointeur vers l'info de la fonction *)
(* Ajoute l'identifiant de la fonction à la TDS. Cette fonction ne fait que de l'effet de bord *)
(* Erreur si l'identifiant de la fonction a déjà été déclaré *)
let ajouter_identifiant_fonction tds nom infoFun_ast =
  match chercherGlobalement tds nom with
    | None ->
      ajouter tds nom infoFun_ast;
    | Some _ ->
      raise (DoubleDeclaration nom)

(* analyse_tds_fonction : AstSyntax.fonction -> AstTds.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstTds.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyse_tds_fonction maintds (AstSyntax.Fonction(t,nom,lp,li,e))  =
  (* L'ordre des opérations est crucial *)

  (* Créer une tds locale pour la fonction ses arguments et ses déclarations locales *)
  let tdsFonction = creerTDSFille maintds in
  (* Analyser d'abord les arguments et les ajouter à la TDS locale *)
  (* Ils peuvent être utilisés dans les instructions et l'expression de retour *)
  let infoListArgs = List.map (fun x -> analyse_args_function tdsFonction x) lp in
  (* Créer l'infoFun de la fonction à partir de son nom, son type et le type de ses paramètres *)
  let infoFun = InfoFun(nom, Undefined, fst (List.split infoListArgs)) in
  let infoFun_ast = info_to_info_ast infoFun in
  (* Ajouter l'identifiant de la fonction à la tds avant l'analyse des instructions permet les appels récursifs *)
  ajouter_identifiant_fonction maintds nom infoFun_ast;
  (* Analyser la liste des instructions dans la fonction *)
  (* On peut déclarer de nouveaux identifiants qui vont être utiliser dans l'expression de retour *)
  let nli = List.map (analyse_tds_instruction tdsFonction) li in
  (* Puis analyser l'expression de retour *)
  let ne = analyse_tds_expression tdsFonction e in
  (* Ajouter la fonction à la tds principale *)
  Fonction (t, infoFun_ast, infoListArgs, nli, ne)

(* analyser : AstSyntax.ast -> AstTds.ast *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le programme
en un programme de type AstTds.ast *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstSyntax.Programme (fonctions,prog)) =
  let tds = creerTDSMere () in
  let nf = List.map (analyse_tds_fonction tds) fonctions in
  let nb = analyse_tds_bloc tds prog in
  Programme (nf, nb)

end