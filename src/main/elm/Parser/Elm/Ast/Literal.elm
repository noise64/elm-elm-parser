module Parser.Elm.Ast.Literal where

type Literal
  = IntNum Int
  | FloatNum Float
  | Chr Char
  | Str String
  | Boolean Bool
