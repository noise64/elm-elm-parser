module Parser.Elm.Parse.Helpers where

import Char
import Parser (..)
import Parser.Char (..)
import String

reserveds : List String
reserveds =
  [ "if", "then", "else"
  , "case", "of"
  , "let", "in"
  , "type"
  , "module", "where"
  , "import", "as", "hiding", "open"
  , "export", "foreign"
  , "deriving", "port"
  ]


var : Parser Char String
var = makeVar <| letter `or` symbol '_'

innerVarChar : Parser Char Char
innerVarChar =
  alphaNum `or`
  symbol '_' `or`
  symbol '\'' 

makeVar : Parser Char Char -> Parser Char String
makeVar charParser =
  String.fromList `map` ((::) `map` charParser `and` many innerVarChar) -- TODO: check for reserved