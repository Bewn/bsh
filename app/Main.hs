module Main where

import qualified BshLib ()

import System.Console.Haskeline
   ( defaultSettings, getInputLine, outputStrLn, runInputT, InputT )
import Control.Concurrent ()


main :: IO ()
main = runInputT defaultSettings loop
   where
      loop :: InputT IO ()
      loop = do
            minput <- getInputLine "% "
            case minput of
                  Nothing -> return ()
                  Just "q" -> return ()
                  Just "quit" -> return ()
                  -- Just "init" -> do initBshTable
                  Just input    ->  do outputStrLn $ "Input was: " ++ input
                                       loop

