import ElmTest.Assertion (..)
import ElmTest.Runner.Console (runDisplay)
import ElmTest.Test (..)
import IO.IO (..)
import IO.Runner (Request, Response, run)
import String
import SimpleDateParser.SimpleDateParserTest as SimpleDateParserTest

{- Tests -}

tests : Test
tests =
  suite "Main elm-elm-parser test suite"
    [ SimpleDateParserTest.tests
    ]

{- Ports -}

port requests : Signal Request
port requests = run responses (runDisplay tests)

port responses : Signal Response
