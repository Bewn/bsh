module Main where

import BshLib (initBshFnc)

import System.Console.Haskeline
    ( defaultSettings, getInputLine, outputStrLn, runInputT, InputT )
import Control.Concurrent ()


main :: IO ()
main = runInputT defaultSettings loop
  where
      loop :: InputT IO ()
      loop = do
            minput <- getInputLine "bsh% "
            case minput of
                  Nothing -> return ()
                  Just "q" -> return ()
                  Just "quit" -> return ()
                  Just "init" -> return ()
                  Just input    ->   do outputStrLn $ "Input was: " ++ input
                                        loop

