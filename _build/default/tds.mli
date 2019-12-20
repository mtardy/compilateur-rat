open Type 

(* Données stockées dans la tds et dans les AST : pointeur sur une information *)
type info_ast

(* Etat de déclaration de la fonction: état prototype ou déclaration complète du corps *)
type etatFun = Proto | Corps

(* Définition du type des informations associées aux identifiants *)
type info =
  (* Information associée à une constante : son nom (non indispensable mais aide au test et debbugage) et sa valeur *)
  | InfoConst of string * int
  (* Information associée à une variable : son nom (non indispensable mais aide au test et debbugage),
  son type, et son adresse ie son déplacement (int) par rapport à un registre (string) *)
  | InfoVar of string * typ * int * string
  (* Information associée à une fonction : son nom (utile pour l'appel), son type de retour et la liste des types des paramètres *)
  (* Boolean = true si la fonction possede un corps *)
  | InfoFun of string * typ * typ list * bool
  (* Info d'une fonction de la passe tds à type *)
  | InfoMultiFun of string * ((typ list) * info_ast) list



(* Table des symboles *)
type tds 



(* Création d'une table des symboles à la racine *)
val creerTDSMere : unit -> tds 

(* Création d'une table des symboles fille *)
(* Le paramètre est la table mère *)
val creerTDSFille : tds -> tds 

(* Ajoute une information dans la table des symboles locale *)
(* tds : la tds courante *)
(* string : le nom de l'identificateur *)
(* info : l'information à associer à l'identificateur *)
(* retour : unit *)
val ajouter : tds -> string -> info_ast -> unit 

(* Recherche les informations d'un identificateur dans la tds locale *)
(* Ne cherche que dans la tds de plus bas niveau *)
val chercherLocalement : tds -> string -> info_ast option 

(* Recherche les informations d'un identificateur dans la tds globale *)
(* Si l'identificateur n'est pas présent dans la tds de plus bas niveau *)
(* la recherche est effectuée dans sa table mère et ainsi de suite *)
(* jusqu'à trouver (ou pas) l'identificateur *)
val chercherGlobalement : tds -> string -> info_ast option 

(* Affiche la tds locale *)
val afficher_locale : tds -> unit 

(* Affiche la tds locale et récursivement *)
val afficher_globale : tds -> unit 

(* Créer une information à associer à l'AST à partir d'une info *)
val info_to_info_ast : info -> info_ast

(* Récupère l'information associée à un noeud *)
val info_ast_to_info : info_ast -> info

(* Modifie le type si c'est une InfoVar, ne fait rien sinon *)
val modifier_type_info : typ -> info_ast -> unit

(* Modifie le types de retour si c'est une InfoFun, ne fait rien sinon *)
(*val modifier_type_fonction_info : typ -> info_ast -> unit*)

(* Ajoute le type des parametres dans l'infoMultiFun et creer la future infoFun
, ne fait rien sinon *)
val ajouterTypeParamFun : typ list -> info_ast -> typ -> bool -> info_ast

(* Modifie l'emplacement (dépl, registre) si c'est une InfoVar, ne fait rien sinon *)
val modifier_adresse_info : int -> string -> info_ast -> unit

val modifier_bol_infoFun : info_ast -> bool -> unit

val is_prototype : info_ast -> bool

(* Renvoie le type d'une info_ast *)
val getType : info_ast -> typ

(* Renvoie le type des paramètres d'une fonction *)
val getTypeParam : info_ast -> ((typ list) * info_ast) list

val est_compatible_fun : typ list -> ((typ list) * info_ast) list -> info_ast option 

val getAddr : info_ast -> int

val getReg : info_ast -> string

val getFunNom : info_ast -> string

(* Renvoie la taille totale des paramètres d'une fonction *)
val getTailleParam : info_ast -> int