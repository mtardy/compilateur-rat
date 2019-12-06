open Hashtbl
open Type

type etatFun = Proto | Corps

(* Définition du type des informations associées aux identifiants *)
type info =
  | InfoConst of string * int
  | InfoVar of string * typ * int * string
  | InfoFun of string * typ * (typ list)
  | InfoPreFun of string * typ * typ list * etatFun
  | InfoMultiFun of string * ((typ list)*info) list


(* Données stockées dans la tds  et dans les AST : pointeur sur une information *)
type info_ast = info ref  

(* Table des symboles hiérarchique *)
(* Les tables locales sont codées à l'aide d'une hashtable *)
type tds =
  | Nulle
  (* Table courante : la table mère - la table courante *)
  | Courante of tds * (string,info_ast) Hashtbl.t


let info_to_info_ast i = ref i

let info_ast_to_info i = !i

let creerTDSMere () = Courante (Nulle, Hashtbl.create 100)

let creerTDSFille mere = Courante (mere, Hashtbl.create 100)

let ajouter tds nom info =
  match tds with
  | Nulle -> failwith "Ajout dans une table vide"
  | Courante (_,c) -> Hashtbl.add c nom info 

let chercherLocalement tds nom =
  match tds with
  | Nulle -> None
  | Courante (_,c) ->  find_opt c nom 

let rec chercherGlobalement tds nom =
  match tds with
  | Nulle -> None
  | Courante (m,c) ->
    match find_opt c nom with
      | Some _ as i -> i
      | None -> chercherGlobalement m nom


let string_of_info info =
  match info with
  | InfoConst (n,value) -> "Constante "^n^" : "^(string_of_int value)
  | InfoVar (n,t,dep,base) -> "Variable "^n^" : "^(string_of_type t)^" "^(string_of_int dep)^"["^base^"]"
  | InfoFun (n,t,tp) -> "Fonction "^n^" : "^(List.fold_right (fun elt tq -> if tq = "" then (string_of_type elt) else (string_of_type elt)^" * "^tq) tp "" )^
                      " -> "^(string_of_type t)
  | InfoMultiFun(n,l) -> "MultiFun" ^ n


let afficher_locale tds =
  match tds with
  | Nulle -> print_newline ()
  |Courante (_,c) -> Hashtbl.iter ( fun n info -> (print_string (n^" : "^(string_of_info (info_ast_to_info info))^"\n"))) c


let afficher_globale tds =
  let rec afficher tds indent =
    match tds with
    | Nulle -> print_newline ()
    | Courante (m,c) -> if Hashtbl.length c = 0
                        then print_string (indent^"<empty>\n")
                        else Hashtbl.iter ( fun n info -> (print_string (indent^n^" : "^(string_of_info (info_ast_to_info info))^"\n"))) c ; afficher m (indent^"  ")
  in afficher tds ""

  let modifier_type_info t i =
    match !i with
    |InfoVar (n,_,dep,base) -> i:= InfoVar (n,t,dep,base)
    | _ -> failwith "Appel modifier_type_info pas sur un InfoVar"
 
 (*let modifier_type_fonction_info t i =
       match !i with
      (* Au niveau de la passe de typage -> MultiFun -> InfoFun a suppr*)
       |InfoFun(n,_,lp) -> i:= InfoFun(n,t,lp)
       | _ -> failwith "Appel modifier_type_fonction_info pas sur un InfoFun ou InfoMultiFun"*)
 
 (* Génération d'étiquette pour les fonctions*)
let getEtiquetteFun = 
  let num = ref 0 in
  fun () ->
    num := (!num)+1 ;
    "#"^((string_of_int (!num)))


 let ajouterTypeParamFun ltyp i typ =
    match !i with
    (* On ajoute à l'info multiFun la liste des type et la future InfoFun associer à
    la fonction qui prend ltyp en parametres *)
    | InfoMultiFun(n,lp) -> 
     let info = InfoFun(n^(getEtiquetteFun ()),typ,ltyp) in
     i:= InfoMultiFun(n,(ltyp,info)::lp);
     info_to_info_ast info
    | _ -> failwith "Ajout d'une list de parametre a autre chose qu'une infoMultiFun"
   
  let rec est_compatible_fun typelist ltypinfolist = match ltypinfolist with
    | [] -> None
    | (ltyp,info)::t ->
      begin
      if (est_compatible_list ltyp typelist) then
        Some (info_to_info_ast info)
      else
        est_compatible_fun typelist t
      end


 let modifier_adresse_info d b i =
     match !i with
     |InfoVar (n,t,_,_) -> i:= InfoVar (n,t,d,b)
     | _ -> failwith "Appel modifier_adresse_info pas sur un InfoVar"
    
let getType info_pointeur =
  let info = info_ast_to_info info_pointeur in
  match info with
  | InfoVar(_, t, _, _) -> t
  | InfoFun(_, t, _) -> t
  (* Code mort en théorie car les InfoConst ont été supprimé à la phase de Tds*)
  | InfoConst(_, _) -> Type.Int 
  | _ -> failwith "getType sur mutltiFun"

let getTypeParam info_pointeur =
  let info = info_ast_to_info info_pointeur in
  match info with
  | InfoMultiFun(_, lt) ->
    lt
  | _ ->
    failwith "Appel incorrect: GetTypeParam uniquement sur InfoFun"

let getAddr info_pointeur =
  let info = info_ast_to_info info_pointeur in
  match info with
  | InfoVar(_, _, addr, _) -> addr
  |_ -> failwith "Internal erreur: getAddr"

let getReg info_pointeur =
  let info = info_ast_to_info info_pointeur in
  match info with
  | InfoVar(_, _, _, reg) -> reg
  |_ -> failwith "Internal erreur: getReg"

let getFunNom info_pointeur =
  let info = info_ast_to_info info_pointeur in
  match info with
  | InfoMultiFun(nom, _ ) -> nom
  | InfoFun(nom, _, _) -> nom
  |_ -> failwith "Internal erreur: getFunNom"

let getTailleParam info_ast =
  let info = info_ast_to_info info_ast in
  match info with
  | InfoFun(_, _, listTypeParam) ->
    List.fold_left (fun tailleActuel element -> tailleActuel + (getTaille element)) 0 listTypeParam
  | _ -> failwith "Internal error: getTypeParam only with InfoFun"