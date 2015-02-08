module SimpleDateParser.SimpleDateParser where

import Parser (..)
import Parser.Char (..)
import String

type Date = Date Month Int

type Month
  = Jan
  | Feb

isSpace : Char -> Bool
isSpace = (==) ' '

space : Parser Char Char
space = satisfy isSpace

spaces : Parser Char (List Char)
spaces = some space

month : Parser Char Month
month =
  Jan <$ token (String.toList "Jan") <|>
  Feb <$ token (String.toList "Feb")

date : Parser Char Date
date = Date <$> month <* spaces <*> natural <* end

parseDate : String -> Result String Date
parseDate =
  let
    checkResult rs =
      case rs of
        Ok [date] -> Ok date
        _ -> Err <| "Excepted [Date] got " ++ toString rs
  in
    checkResult << parseString date