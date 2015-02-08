module Parser.Char (digit, natural, integer, float, upper, lower, alphaNum, letter, parenthesized, bracketed, braced) where

{-| Some parsers

@docs digit, natural, integer, float, upper, lower, parenthesized, bracketed, braced

-}

import Char
import Parser
import Parser (..)
import List
import List (..)

{-| Parse a digit as Int -}
digit : Parser Char Char
digit = satisfy Char.isDigit

{-| Parse a digit as Int -}
digitAsInt : Parser Char Int
digitAsInt = (\x -> Char.toCode x - 48) `Parser.map` satisfy Char.isDigit

{-| Parse a natural number -}
natural : Parser Char Int
natural = foldl (\b a -> a * 10 + b) 0 `Parser.map` some digitAsInt

{-| Parse an integer -}
integer : Parser Char Int
integer = (always (\x -> -x) `Parser.map` (symbol '-')) `optional` identity `and` natural

{-| Parse a float -}
float : Parser Char Float
float = (\i f -> toFloat i + 0.1 * foldr (\b a -> a / 10 + b) 0 (List.map toFloat f))  `Parser.map` integer <* symbol '.' `and` some digitAsInt

{-| Parse a upper case character -}
upper : Parser Char Char
upper = satisfy Char.isUpper

{-| Parse a lower case character -}
lower : Parser Char Char
lower = satisfy Char.isLower

{-| Parse a letter or digit |-}
alphaNum : Parser Char Char
alphaNum = letter `or` digit

{-| Parse a letter (an upper case or lower case character) |-}
letter : Parser Char Char
letter = satisfy (\ch -> (Char.isUpper ch || Char.isLower ch))

{-| Parse a parser between parentheses `(` and `)`-}
parenthesized : Parser Char r -> Parser Char r
parenthesized p = symbol '(' *> p <*symbol ')'

{-| Parses a parser between brackets `[` and `]` -}
bracketed : Parser Char r -> Parser Char r
bracketed p = symbol '[' *> p <* symbol ']'

{-| Parses a parser between braces `{` and `}`-}
braced : Parser Char r -> Parser Char r
braced p = symbol '{' *>  p <* symbol '}'

