type typ = Bool | Int | Rat | Str | Undefined | Pointeur of typ

let rec string_of_type t = 
  match t with
  | Bool ->  "Bool"
  | Int  ->  "Int"
  | Rat  ->  "Rat"
  | Str   -> "String"
  | Undefined -> "Undefined"
  | Pointeur(typ) -> "Pointeur of "^(string_of_type typ)


let rec est_compatible t1 t2 =
  match t1, t2 with
  | Bool, Bool -> true
  | Int, Int -> true
  | Rat, Rat -> true
  | Str, Str -> true
  (* Les deux cas ci-dessous sont ajoutés pour les pointeurs *)
  (* Cela ne devrait pas poser de conflits particuliers *)
  | Undefined, _ -> true
  | _, Undefined -> true
  | Pointeur(typ1), Pointeur(typ2) -> (est_compatible typ1 typ2)
  | _ -> false

let est_compatible_list lt1 lt2 =
  try
    List.for_all2 est_compatible lt1 lt2
  with Invalid_argument _ -> false

let getTaille t =
  match t with
  | Int -> 1
  | Bool -> 1
  | Rat -> 2
  | Str -> 1
  | Undefined -> 0
  | Pointeur(_) -> 1 
  
