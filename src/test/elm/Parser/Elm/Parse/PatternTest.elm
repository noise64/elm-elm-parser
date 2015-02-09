module Parser.Elm.Parse.PatternTest where

import ElmTest.Assertion (..)
import ElmTest.Test (..)
import Parser (..)
import Parser.Elm.Ast.Literal as AstLiteral
import Parser.Elm.Ast.Pattern as AstPattern
import Parser.Elm.Ast.Variable as AstVariable
import Parser.Elm.Parse.Pattern as ParsePattern

tests : Test
tests =
  suite "Parser.Elm.Parse.PatternTest suite"
    [ testParseBasicPattern "_" <| AstPattern.Anything
    , testParseBasicPattern "True" <| AstPattern.Literal (AstLiteral.Boolean True)
    , testParseBasicPattern "False" <| AstPattern.Literal (AstLiteral.Boolean False)
    , testParseBasicPattern "List" <| AstPattern.Data (AstVariable.Raw "List") []
    , testParseBasicPattern "Maybe" <| AstPattern.Data (AstVariable.Raw "Maybe") []
    , testParseBasicPattern "a" <| AstPattern.Var "a"
    , testParseBasicPattern "ab_cd" <| AstPattern.Var "ab_cd"
    ]

testParseBasicPattern : String -> AstPattern.Pattern AstVariable.Raw -> Test
testParseBasicPattern patternStr expectedAstPattern =
  let
    description = "test parse basic pattern \"" ++ patternStr ++ "\""

    assertion =
      assertEqual
        (Ok [expectedAstPattern])
        (parseString (ParsePattern.basic <* end) patternStr)
  in
    test description assertion

