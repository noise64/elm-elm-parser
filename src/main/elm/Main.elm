module Main where

import IO.IO (IO, (>>>))
import IO.IO as IO
import IO.Runner as IORunner

{-- Main --}

mainIo : IO ()
mainIo =
  putSep >>>
  IO.putStrLn "Hello" >>>
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

