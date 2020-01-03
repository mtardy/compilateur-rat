open Compilateur
open Exceptions

exception ErreurNonDetectee

let%test_unit "testPrototype1"= 
  let _ = compiler "../../fichiersRat/test-prototypes/testPrototype1.rat" in ()

let%test_unit "testPrototype2"= 
  let _ = compiler "../../fichiersRat/test-prototypes/testPrototype2.rat" in ()

let%test_unit "testPrototype3"= 
  try 
    let _ = compiler "../../fichiersRat/test-prototypes/testPrototype3.rat"
    in raise ErreurNonDetectee
  with
  | SurchargeTypeRetour("f") -> ()

let%test_unit "testPrototype4"= 
  try 
    let _ = compiler "../../fichiersRat/test-prototypes/testPrototype4.rat"
    in raise ErreurNonDetectee
  with
  | SurchargeTypeRetour("f") -> ()

let%test_unit "testPrototype5"=
  let _ = compiler "../../fichiersRat/test-prototypes/testPrototype5.rat" in ()

let%test_unit "testMutuelRecursif"=
  let _ = compiler "../../fichiersRat/test-prototypes/testMutuelRecursif.rat" in ()

let%test_unit "testPrototypeManquant1"=
  try
    let _ = compiler "../../fichiersRat/test-prototypes/testPrototypeManquant1.rat"
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("f") -> ()

let%test_unit "testPrototypeManquant2"=
  try
    let _ = compiler "../../fichiersRat/test-prototypes/testPrototypeManquant2.rat"
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("g") -> ()

let%test_unit "testPrototypeManquant3"= 
  try
    let _ = compiler "../../fichiersRat/test-prototypes/testPrototypeManquant3.rat"
    in  raise ErreurNonDetectee
  with
  | TypesParametresInattendus _ -> ()

let%test_unit "testCorpsManquant1"= 
  try 
    let _ = compiler "../../fichiersRat/test-prototypes/testCorpsManquant1.rat"
    in raise ErreurNonDetectee
  with
  | CorpsFonctionManquant("f") -> ()

let%test_unit "testCorpsManquant2"=
  try 
    let _ = compiler "../../fichiersRat/test-prototypes/testCorpsManquant2.rat"
    in raise ErreurNonDetectee
  with
  | CorpsFonctionManquant("f") -> ()