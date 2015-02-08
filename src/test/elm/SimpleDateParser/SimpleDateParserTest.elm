module SimpleDateParser.SimpleDateParserTest where

import ElmTest.Assertion (..)
import ElmTest.Test (..)
import Result.Extra (..)
import SimpleDateParser.SimpleDateParser (..)

tests : Test
tests =
  suite "SimpleDateParser test suite"
    [ test "parse \"Jan 10\"" <| assertEqual (parseDate "Jan 10") (Ok <| Date Jan 10)
    , test "parse \"Feb 3\"" <| assertEqual (parseDate "Feb 3") (Ok <| Date Feb 3)
    , test "parse \"Feb3\"" <| assert <| isErr (parseDate "Feb3")
    , test "parse \"XXX 30\"" <| assert <| isErr (parseDate "XXX 30")
    ]
