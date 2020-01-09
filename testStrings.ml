open Compilateur
open Exceptions

exception ErreurNonDetectee

let%test_unit "testString1"= 
  let _ = compiler "../../fichiersRat/test-strings/testString1.rat" in ()

let%test_unit "testString2"= 
  try
  let _ = compiler "../../fichiersRat/test-strings/testString2.rat"
  in  raise ErreurNonDetectee
  with
  | TypeInattendu(Int, Str) -> ()

let%test_unit "testSousChaine"= 
  let _ = compiler "../../fichiersRat/test-strings/testSousChaine.rat" in ()

let%test_unit "testConcat"= 
  let _ = compiler "../../fichiersRat/test-strings/testConcat.rat" in ()

let%test_unit "testLength"= 
  let _ = compiler "../../fichiersRat/test-strings/testLength.rat" in ()

let%test_unit "testMix"= 
  let _ = compiler "../../fichiersRat/test-strings/testMix.rat" in ()