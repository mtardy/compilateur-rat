open Compilateur
open Exceptions

exception ErreurNonDetectee

let%test_unit "testSurcharge1"= 
  let _ = compiler "../../fichiersRat/test-surcharge/testSurcharge1.rat" in ()