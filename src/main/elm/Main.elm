module Main where

import IO.IO (IO, (>>>))
import IO.IO as IO
import IO.Runner as IORunner

{-- Main --}

mainIo : IO ()
mainIo =
  IO.putStrLn "Hello IO!" >>>
  IO.exit 0

{-- Ports --}

port requests : Signal IORunner.Request
port requests = IORunner.run responses mainIo

port responses : Signal IORunner.Response
