module FormattingTests exposing (tests)

import Expect
import Formatting
import Test.Table exposing (testTable)


tests =
    testTable "ordinal number suffixes"
        [ ( 0, "th" )
        , ( 1, "st" )
        , ( 2, "nd" )
        , ( 3, "rd" )
        , ( 4, "th" )
        , ( 5, "th" )
        , ( 6, "th" )
        , ( 7, "th" )
        , ( 8, "th" )
        , ( 9, "th" )
        , ( 10, "th" )
        , ( 11, "th" )
        , ( 12, "th" )
        , ( 13, "th" )
        , ( 14, "th" )
        , ( 15, "th" )
        , ( 16, "th" )
        , ( 17, "th" )
        , ( 18, "th" )
        , ( 19, "th" )
        , ( 20, "th" )
        , ( 21, "st" )
        , ( 22, "nd" )
        , ( 23, "rd" )
        , ( 24, "th" )
        , ( 25, "th" )
        , ( 101, "st" )
        , ( 102, "nd" )
        , ( 103, "rd" )
        , ( 111, "th" )
        , ( 115, "th" )
        , ( 1147, "th" )
        , ( 10101, "st" )
        , ( 47111, "th" )
        , ( 100000, "th" )
        ]
        (\( n, expectedSuffix ) -> Formatting.ordinalIndicator n |> Expect.equal expectedSuffix)