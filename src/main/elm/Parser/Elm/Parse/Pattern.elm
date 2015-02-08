module Parser.Elm.Parse.Pattern where

import Char
import Parser (..)
import Parser.Char (..)
import Parser.Elm.Ast.Pattern as AstPattern
import Parser.Elm.Ast.Variable as AstVariable
import Parser.Elm.Ast.Literal as AstLiteral
import Parser.Elm.Parse.Helpers as ParseHelpers
import String

basic : Parser Char AstPattern.RawPattern
basic =
  let
    startsWithUpperCaseLetter str =
      case String.uncons str of
        Just (ch, _) -> Char.isUpper ch
        Nothing -> False

    stringToPattern str =
      case str of
        "True" -> AstPattern.Literal (AstLiteral.Boolean True)
        "False" -> AstPattern.Literal (AstLiteral.Boolean False)
        str ->
          if startsWithUpperCaseLetter str
            then AstPattern.Data (AstVariable.Raw str) []
            else AstPattern.Var str
  in
    choice
    [ (\_ -> AstPattern.Anything) `map` symbol '_'
    , stringToPattern `map` ParseHelpers.var
    ]
