open Compilateur
open Exceptions

exception ErreurNonDetectee

(* Tests passe Tds *)
let%test_unit "testDoubleDeclaration1"= 
  try
  let _ = compiler "../../fichiersRat/test-surcharge/tds/testDoubleDeclaration1.rat"
  in  raise ErreurNonDetectee
  with
  | DoubleDeclaration "f" -> ()


(* Tests passe de Typage *)
let%test_unit "testDoubleDeclaration2"= 
  try
  let _ = compiler "../../fichiersRat/test-surcharge/type/testDoubleDeclaration2.rat"
  in  raise ErreurNonDetectee
  with
  | SurchargeTypeRetour "g" -> ()


(* Tests passe génération de code *)
let%expect_test "testSurcharge1" =
  TestTam.runtam "../../fichiersRat/test-surcharge/tam/testSurcharge1.rat";
  [%expect{| 25 |}]

let%expect_test "testSurcharge2" =
  TestTam.runtam "../../fichiersRat/test-surcharge/tam/testSurcharge2.rat";
  [%expect{| 83 |}]

let%expect_test "testSurcharge3" =
  TestTam.runtam "../../fichiersRat/test-surcharge/tam/testSurcharge3.rat";
  [%expect{| [1/2]6 |}]

let%expect_test "testSurcharge4" =
  TestTam.runtam "../../fichiersRat/test-surcharge/tam/testSurcharge4.rat";
  [%expect{| 7778889993 |}]

let%expect_test "testSurcharge5" =
  TestTam.runtam "../../fichiersRat/test-surcharge/tam/testSurcharge5.rat";
  [%expect{| 7778889993 |}]
