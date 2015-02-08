module Main where

import IO.IO (IO, (>>>))
import IO.IO as IO
import IO.Runner as IORunner
import Parser (..)
import Parser.Char (..)
import Result (Result(..))
import String

{-- Main --}

mainIo : IO ()
mainIo =
  putSep >>>
  IO.putStrLn (toString (parseDate "Feb 10")) >>>
  IO.putStrLn (toString (parseDate "Jan 8")) >>>
  putSep >>>
  IO.exit 0

putSep : IO ()
putSep =
  IO.putStrLn "" >>>
  IO.putStrLn "------------------------------" >>>
  IO.putStrLn ""

{-- Ports --}

port requests : Signal IORunner.Request
port requests = IORunner.run responses mainIo

port responses : Signal IORunner.Response

{-- Test parser --}

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
