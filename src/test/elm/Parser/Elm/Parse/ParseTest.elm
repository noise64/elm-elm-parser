module Parser.Elm.Parse.ParseTest where

import ElmTest.Assertion (..)
import ElmTest.Test (..)
import Parser.Elm.Parse.PatternTest as PatternTest

tests : Test
tests =
  suite "Parser.Elm.Parse.ParseTest suite"
    [ PatternTest.tests
    ]