module Main where

import IO.IO (IO, (>>>))
import IO.IO as IO
import IO.Runner as IORunner

mainIo : IO ()
mainIo =
  IO.putStrLn "Hello world!" >>>
  IO.exit 0

port requests : Signal IORunner.Request
port requests = IORunner.run responses mainIo

port responses : Signal IORunner.Response
