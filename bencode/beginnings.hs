#!/usr/bin/env stack
{- stack script --resolver lts-20.20
   --package process
   --package hashtables
   --package haskeline
 -}

import qualified Data.HashTable.IO as Ht
import System.Console.Haskeline
import System.Console.Haskeline.IO as Hlio
import Control.Concurrent

-- this is going to be a haskell based domain specific languge for a functional shell
-- it will be called bsh because that's like bash and the aim is to replace bash

main :: IO ()
main = putStrLn "hello bish"

type HashTable k v = Ht.BasicHashTable k v

