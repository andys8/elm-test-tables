module Test.Table exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int)
import Test exposing (Test)



-- Table tests


{-| Test a list of inputs. Please use fuzzTable instead if you can.
-}
testTable :
  String
  -> List a
  -> (a -> Expectation)
  -> Test
testTable description edgeCases getExpectation =
  Test.describe description <|
    List.indexedMap
      (\index input ->
        Test.test
          (tableRowDesc index input)
          (\() -> getExpectation input)
      )
      edgeCases


{-| Test a list of inputs. Please use fuzzTable2 instead if you can.
-}
testTable2 :
  String
  -> List ( a, b )
  -> (a -> b -> Expectation)
  -> Test
testTable2 description edgeCases getExpectation =
  Test.describe description <|
    List.indexedMap
      (\index ( a, b ) ->
        Test.test
          (tableRowDesc index ( a, b ))
          (\() -> getExpectation a b)
      )
      edgeCases


{-| Test a list of inputs. Please use fuzzTable3 instead if you can.
-}
testTable3 :
  String
  -> List ( a, b, c )
  -> (a -> b -> c -> Expectation)
  -> Test
testTable3 description edgeCases getExpectation =
  Test.describe description <|
    List.indexedMap
      (\index ( a, b, c ) ->
        Test.test
          (tableRowDesc index ( a, b, c ))
          (\() -> getExpectation a b c)
      )
      edgeCases


{-| Test a list of inputs. Please use fuzzTable4 instead if you can.
-}
testTable4 :
  String
  -> List ( a, b, c, d )
  -> (a -> b -> c -> d -> Expectation)
  -> Test
testTable4 description edgeCases getExpectation =
  Test.describe description <|
    List.indexedMap
      (\index ( a, b, c, d ) ->
        Test.test
          (tableRowDesc index ( a, b, c, d ))
          (\() -> getExpectation a b c d)
      )
      edgeCases


{-| Test a list of inputs. Please use fuzzTable5 instead if you can.
-}
testTable5 :
  String
  -> List ( a, b, c, d, e )
  -> (a -> b -> c -> d -> e -> Expectation)
  -> Test
testTable5 description edgeCases getExpectation =
  Test.describe description <|
    List.indexedMap
      (\index ( a, b, c, d, e ) ->
        Test.test
          (tableRowDesc index ( a, b, c, d, e ))
          (\() -> getExpectation a b c d e)
      )
      edgeCases



-- helpers


tableRowDesc index args =
  let
    tupleString =
      toString args
  in
  if String.length tupleString < 40 then
    "table test row " ++ toString index ++ ": " ++ tupleString

  else
    "table test row " ++ toString index
