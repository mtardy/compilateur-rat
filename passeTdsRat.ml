(* Module de la passe de gestion des identifiants *)
module PasseTdsRat : Passe.Passe with type t1 = Ast.AstSyntax.programme and type t2 = Ast.AstTds.programme =
struct

  open Tds
  open Exceptions
  open Ast
  open AstTds

  type t1 = Ast.AstSyntax.programme
  type t2 = Ast.AstTds.programme

(* analyse_tds_affectable_lecture : AstSyntax.affectable -> tds -> AstTds.affectable *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre a : l'affectable à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme l'affectable
en un affectable de type AstTds.affectable *)
(* Erreur si mauvaise utilisation des identifiants *)
(* Cette fonction permet aussi de transformer les identifiants des constantes en leur valeur
à la fin de la passe (voir suite du code dans analyse_tds_expression pour les Accès) *)
let rec analyse_tds_affectable_lecture tds a =
  match a with
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
          (* On supprime les InfoConst et on retourne un entier *)
          (* Ici, pirouette de l'extrême pour déguiser la constante en affectable *)
          | InfoConst (n, value) -> Ident(info_to_info_ast (InfoConst(n, value)))
          (* Un identifiant dans une expression ne peut pas être l'identifiant d'une fonction *)
          | InfoMultiFun(_) -> raise (MauvaiseUtilisationIdentifiant id)
          | _ -> Ident(infoId)
          end
    end
    | AstSyntax.Valeur aff ->
      Valeur(analyse_tds_affectable_lecture tds aff)

(* analyse_tds_affectable_ecriture : AstSyntax.affectable -> tds -> AstTds.affectable *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre a : l'affectable à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme l'affectable
en un affectable de type AstTds.affectable *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_affectable_ecriture tds a =
  match a with
  | AstSyntax.Ident (n) ->
    begin
    match chercherGlobalement tds n with
    | None ->
      (* L'identifiant n'est pas trouvé dans la tds globale. *)
      raise (IdentifiantNonDeclare n)
    | Some info_ast ->
      (* L'identifiant est trouvé dans la tds globale,
      il a donc déjà été déclaré. L'information associée est récupérée. *)
      begin
      match info_ast_to_info info_ast with
        | InfoVar _ ->
          Ident(info_ast)
        |  _ ->
          (* Modification d'une constante ou d'une fonction *)
          raise (MauvaiseUtilisationIdentifiant n)
      end
    end
  | AstSyntax.Valeur (aff) ->
    Valeur(analyse_tds_affectable_ecriture tds aff)

(* analyse_tds_expression : AstSyntax.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_expression tds e =
  match e with
  | AstSyntax.SousChaine(e, e1, e2) ->
    let ne = analyse_tds_expression tds e in
    let ne1 = analyse_tds_expression tds e1 in
    let ne2 = analyse_tds_expression tds e2 in
    SousChaine(ne,ne1,ne2)
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
            | InfoMultiFun(_) ->
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
  | AstSyntax.Taille(expr) ->
      let exprTds = analyse_tds_expression tds expr in
      Taille (exprTds)
  | AstSyntax.True -> True
  | AstSyntax.False -> False
  | AstSyntax.Entier (entier) ->
      Entier (entier)
  | AstSyntax.Chaine (chaine) -> Chaine (chaine)
  | AstSyntax.Binaire (op, expr1, expr2) ->
      (* Analyser les sous expressions *)
      let expr1Tds = analyse_tds_expression tds expr1 in
      let expr2Tds = analyse_tds_expression tds expr2 in
      Binaire(op, expr1Tds, expr2Tds)
  | AstSyntax.New (typ) ->
    New(typ)
  (* On analyse les identifiants des accès *)
  (* On remplace les identifiants des constantes par leur valeur *)
  | AstSyntax.Acces (a) ->
    let na = analyse_tds_affectable_lecture tds a in
    begin
    (* On essai d'enlever le déguisement d'affectable des constantes, cf analyse_tds_affectable_lecture *)
    match na with
    | Ident(info_ast) ->
      begin
      match (info_ast_to_info info_ast) with
      | InfoConst (_, value) -> Entier(value)
      | _ -> Acces(na)
      end
    | Valeur(_) -> Acces(na)
    end
  (* On cherche si l'identifiant dont on veut l'adresse existe *)
  | AstSyntax.Adresse (n) ->
    begin
    match chercherGlobalement tds n with
    | None ->
      raise (IdentifiantNonDeclare n)
    | Some info_ast ->
      Adresse(info_ast)
    end
  | AstSyntax.Null ->
    Null

(* analyse_tds_instruction : AstSyntax.instruction -> tds -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme l'instruction
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
  | AstSyntax.Affectation (a, e) ->
    let na = analyse_tds_affectable_ecriture tds a in
    (* Vérification de la bonne utilisation des identifiants dans l'expression *)
    (* et obtention de l'expression transformée *)
    let ne = analyse_tds_expression tds e in
    Affectation(na, ne)
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
(* Vérifie la bonne utilisation des identifiants et transforme le bloc
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
let ajouter_identifiant_fonction tds nom =
  (* On cherche si la fonction est deja declaré *)
  match chercherGlobalement tds nom with
    | None ->
      (* Si ce n'est pas le cas, on creer une infoMultiFun avec le nom *)
      (* On remplira cette infoMultiFun lors de la phase de typage avec les différentes fonctions surchargées *)
      let infoMultiFun = InfoMultiFun(nom, []) in
      let infoFun_ast = info_to_info_ast infoMultiFun in
      ajouter tds nom infoFun_ast;
      infoFun_ast
    | Some info ->
    (* Sinon on recupere l'info deja existante *)
      begin
      (* Dans la structure actuelle il ne peut y avoir que des fonction dans *)
      (* le corps du programme on s'en assure donc en plus ici *)
      match (Tds.info_ast_to_info info) with
        (* Le nom est deja pris par une fonction -> On a affaire à une surcharge *)
        | InfoMultiFun(_,_) -> info
        (* Que des fonctions dans le corps *)
        | _ -> raise (ErreurInterne)
      end

(* analyse_tds_fonction : AstSyntax.fonction -> AstTds.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstTds.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyse_tds_fonction maintds fonction =
  match fonction with
  | AstSyntax.Prototype(t, nom, lp) ->
    let info_ast = ajouter_identifiant_fonction maintds nom in
    let (ltp, _) = List.split lp in
    Prototype(t,info_ast,ltp)
  | AstSyntax.Fonction(t, nom, lp, li, e) ->
  (* L'ordre des opérations est crucial *)
  (* Créer une tds locale pour la fonction ses arguments et ses déclarations locales *)
  let tdsFonction = creerTDSFille maintds in
  (* Analyser d'abord les arguments et les ajouter à la TDS locale *)
  (* Ils peuvent être utilisés dans les instructions et l'expression de retour *)
  let infoListArgs = List.map (fun x -> analyse_args_function tdsFonction x) lp in
  (* Ajouter l'identifiant de la fonction à la tds avant l'analyse des instructions permet les appels récursifs *)
  let info = ajouter_identifiant_fonction maintds nom in
  (* Analyser la liste des instructions dans la fonction *)
  (* On peut déclarer de nouveaux identifiants qui vont être utiliser dans l'expression de retour *)
  let nli = List.map (analyse_tds_instruction tdsFonction) li in
  (* Puis analyser l'expression de retour *)
  let ne = analyse_tds_expression tdsFonction e in
  (* Ajouter la fonction à la tds principale *)
  Fonction (t, info, infoListArgs, nli, ne)

(* analyser : AstSyntax.ast -> AstTds.ast *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme le programme
en un programme de type AstTds.ast *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstSyntax.Programme(fonctions1, prog, fonctions2)) =
  let tds = creerTDSMere () in
  let nf1 = List.map (analyse_tds_fonction tds) fonctions1 in
  let nb = analyse_tds_bloc tds prog in
  let nf2 = List.map (analyse_tds_fonction tds) fonctions2 in
  Programme (nf1, nb, nf2)

end