open Compilateur
open Exceptions

exception ErreurNonDetectee

(* Tests passe Tds *)
let%test_unit "testPrototypeManquant1"=
  try
    let _ = compiler "../../fichiersRat/test-prototypes/tds/testPrototypeManquant1.rat"
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("f") -> ()

let%test_unit "testPrototypeManquant2"=
  try
    let _ = compiler "../../fichiersRat/test-prototypes/tds/testPrototypeManquant2.rat"
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("g") -> ()

let%test_unit "testPrototype1"= 
  let _ = compiler "../../fichiersRat/test-prototypes/tds/testPrototype1.rat" in ()

let%test_unit "testPrototype2"= 
  let _ = compiler "../../fichiersRat/test-prototypes/tds/testPrototype2.rat" in ()


(* Tests passe de Typage *)
let%test_unit "testPrototypeManquant3"= 
  try
    let _ = compiler "../../fichiersRat/test-prototypes/type/testPrototypeManquant3.rat"
    in  raise ErreurNonDetectee
  with
  | TypesParametresInattendus _ -> ()

let%test_unit "testPrototype3"= 
  try
    let _ = compiler "../../fichiersRat/test-prototypes/type/testPrototype3.rat"
    in raise ErreurNonDetectee
  with
  | SurchargeTypeRetour("f") -> ()

let%test_unit "testPrototype4"= 
  try 
    let _ = compiler "../../fichiersRat/test-prototypes/type/testPrototype4.rat"
    in raise ErreurNonDetectee
  with
  | SurchargeTypeRetour("f") -> ()

let%test_unit "testPrototype5"=
  let _ = compiler "../../fichiersRat/test-prototypes/type/testPrototype5.rat" in ()


(* Tests passe de placement *)
let%test_unit "testCorpsManquant1"= 
  try 
    let _ = compiler "../../fichiersRat/test-prototypes/placement/testCorpsManquant1.rat"
    in raise ErreurNonDetectee
  with
  | CorpsFonctionManquant("f") -> ()

let%test_unit "testCorpsManquant2"=
  try 
    let _ = compiler "../../fichiersRat/test-prototypes/placement/testCorpsManquant2.rat"
    in raise ErreurNonDetectee
  with
  | CorpsFonctionManquant("f") -> ()


(* Tests passe génération de code *)
let%expect_test "testMutuelRecursif" =
  TestTam.runtam "../../fichiersRat/test-prototypes/tam/testMutuelRecursif.rat";
  [%expect{| 0 |}]