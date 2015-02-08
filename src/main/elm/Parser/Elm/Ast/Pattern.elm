module Parser.Elm.Ast.Pattern where

import Parser.Elm.Ast.Literal as AstLiteral
import Parser.Elm.Ast.Variable as AstVariable

type Pattern var
  = Data var (List (Pattern var))
  | Record (List String)
  | Alias String (Pattern var)
  | Var String
  | Anything
  | Literal AstLiteral.Literal

type alias RawPattern = Pattern AstVariable.Raw