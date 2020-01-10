open Compilateur
open Exceptions

exception ErreurNonDetectee

(* Tests passe Tds*)
let%test_unit "testPointeursTds1"= 
  let _ = compiler "../../fichiersRat/test-pointeurs/tds/testPointeursTds1.rat" in ()

let%test_unit "testPointeursTds2"= 
  try
  let _ = compiler "../../fichiersRat/test-pointeurs/tds/testPointeursTds2.rat"
  in  raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare "a" -> ()

let%test_unit "testPointeursTds3"= 
  let _ = compiler "../../fichiersRat/test-pointeurs/tds/testPointeursTds3.rat" in ()

(* Tests passe Typage *)
let%test_unit "testPointeursType1"=
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType1.rat" in ()

let%test_unit "testPointeursType2"= 
  try
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType2.rat"
  in  raise ErreurNonDetectee
  with
  | TypeInattendu (Pointeur(Str), Pointeur(Int)) -> ()

let%test_unit "testPointeursType3"= 
  try
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType3.rat"
  in  raise ErreurNonDetectee
  with
  | TypeInattendu (Pointeur(Rat), Pointeur(Int)) -> ()

let%test_unit "testPointeursType4"= 
  try
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType4.rat"
  in  raise ErreurNonDetectee
  with
  | TypeInattendu (Pointeur(Rat), Pointeur(Int)) -> ()

let%test_unit "testPointeursType5"= 
  try
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType5.rat"
  in  raise ErreurNonDetectee
  with
  | TypeInattendu (Pointeur(Rat), Pointeur(Int)) -> ()

let%test_unit "testPointeursType6"=
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType6.rat" in ()

let%test_unit "testPointeursType7"=
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType7.rat" in ()

let%test_unit "testPointeursType8"=
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType8.rat" in ()

let%test_unit "testPointeursType9"= 
  try
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType9.rat"
  in  raise ErreurNonDetectee
  with
  | TypesParametresInattendus _ -> ()

let%test_unit "testPointeursType10"=
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType10.rat" in ()

let%test_unit "testPointeursType11"=
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType11.rat" in ()

let%test_unit "testPointeursType12"= 
  try
  let _ = compiler "../../fichiersRat/test-pointeurs/type/testPointeursType12.rat"
  in  raise ErreurNonDetectee
  with
  | TypeInattendu (Rat, Int) -> ()

(* Test passe génération de code *)
(*
let%expect_test "testTamPointeurs1" =
  TestTam.runtam "../../fichiersRat/test-pointeurs/tam/testTamPointeurs1.rat";
  [%expect{| 3 |}]

let%expect_test "testTamPointeurs2" =
  TestTam.runtam "../../fichiersRat/test-pointeurs/tam/testTamPointeurs2.rat";
  [%expect{| 99 |}]
*)