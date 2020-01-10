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

(* Passe de Tds *)
let%test_unit "testAffectation1"=
  let _ = compiler "../../fichiersRat/test-strings/tds/testAffectation1.rat" in ()

let%test_unit "testAffectation2"=
  let _ = compiler "../../fichiersRat/test-strings/tds/testAffectation2.rat" in ()

let%test_unit "testDoubleDeclarationString"= 
  try
  let _ = compiler "../../fichiersRat/test-strings/tds/testDoubleDeclarationString.rat"
  in  raise ErreurNonDetectee
  with
  | DoubleDeclaration "s" -> ()

let%test_unit "testRecursiviteVariable1"=
  try
  let _ = compiler "../../fichiersRat/test-strings/tds/testRecursiviteVariable1.rat"
  in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("s") -> ()

let%test_unit "testRecursiviteVariable2"=
  let _ = compiler "../../fichiersRat/test-strings/tds/testRecursiviteVariable2.rat" in ()

let%test_unit "testUtilisation1"=
  let _ = compiler "../../fichiersRat/test-strings/tds/testUtilisation1.rat" in ()

let%test_unit "testUtilisation2"=
  let _ = compiler "../../fichiersRat/test-strings/tds/testUtilisation2.rat" in ()

let%test_unit "testUtilisation3"=
  let _ = compiler "../../fichiersRat/test-strings/tds/testUtilisation3.rat" in ()

let%test_unit "testUtilisation4"=
  let _ = compiler "../../fichiersRat/test-strings/tds/testUtilisation4.rat" in ()

let%test_unit "testUtilisation5"=
  try
  let _ = compiler "../../fichiersRat/test-strings/tds/testUtilisation5.rat"
  in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare "d" -> ()

(* Passe de Type *)
let%test_unit "testConcat1"=
  let _ = compiler "../../fichiersRat/test-strings/type/testConcat1.rat" in ()

let%test_unit "testConcat2"=
  try
  let _ = compiler "../../fichiersRat/test-strings/type/testConcat2.rat"
  in raise ErreurNonDetectee
  with
  | TypeBinaireInattendu (Concat, Str, Int) -> ()

let%test_unit "testSousChaine1"=
  let _ = compiler "../../fichiersRat/test-strings/type/testSousChaine1.rat" in ()

let%test_unit "testSousChaine2"=
  try
  let _ = compiler "../../fichiersRat/test-strings/type/testSousChaine2.rat"
  in raise ErreurNonDetectee
  with
  | TypeInattendu (Rat, Int) -> ()

let%test_unit "testConcatSousChaine"=
  let _ = compiler "../../fichiersRat/test-strings/type/testConcatSousChaine.rat" in ()

let%test_unit "testLength1"=
  let _ = compiler "../../fichiersRat/test-strings/type/testLength1.rat" in ()

let%test_unit "testLength2"=
  try
  let _ = compiler "../../fichiersRat/test-strings/type/testLength2.rat"
  in raise ErreurNonDetectee
  with
  | TypeInattendu (Int, Str) -> ()

let%test_unit "testInitialisation1"=
  let _ = compiler "../../fichiersRat/test-strings/type/testInitialisation1.rat" in ()

let%test_unit "testInitialisation2"=
  try
  let _ = compiler "../../fichiersRat/test-strings/type/testInitialisation2.rat"
  in raise ErreurNonDetectee
  with
  | TypeInattendu (Int, Str) -> ()

let%test_unit "testInitialisation3"=
  try
  let _ = compiler "../../fichiersRat/test-strings/type/testInitialisation3.rat"
  in raise ErreurNonDetectee
  with
  | TypeInattendu (Str, Int) -> ()