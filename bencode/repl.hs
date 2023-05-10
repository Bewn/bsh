#!/usr/bin/env stack
{- stack script --resolver lts-20.20
    --package haskeline
    --package hashtables
    --package process
-}
import System.Console.Haskeline
import System.Console.Haskeline.IO
import qualified Data.HashTable.IO as Ht
import Control.Concurrent

main :: IO ()
main = runInputT defaultSettings loop
   where
       loop :: InputT IO ()
       loop = do
           minput <- getInputLine "bsh% "
           case minput of
               Nothing -> return ()
               Just "quit" -> return ()
               Just input -> do outputStrLn $ "echo: " ++ input
                                loop