#!/usr/bin/env stack
{- stack script --resolver lts-20.20
   --package process
   --package hashtables
   --package haskeline
   --package hsshellscript
   --package shell-monad
   --package text
   --package shell-conduit
-}

{-
{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}
-}

import qualified Data.HashTable.IO as Ht

import System.Console.Haskeline
import System.Console.Haskeline.IO
import Control.Concurrent

-- import HsShellScript

-- this is going to be a haskell based domain specific language for a functional shell
-- it will be called bsh because that's like bash and the aim is to replace bash

-- import Control.Monad.Shell
-- import Data.Monoid
-- import qualified Data.Text.Lazy as T
-- import qualified Data.Text.Lazy.IO as T
-- default (T.Text)

type HashTable k v = Ht.BasicHashTable k v

{-
main :: IO ()
main = T.writeFile "hello.sh" $ script $ do
   cmd "echo" "hello, world"
   username <- newVarFrom (Output (cmd "whoami")) ()
   cmd "echo" "from" (WithVar username (<> "'s shell"))
-}

----------- type definitions
newtype BshFunctionName = BshFunctionName String
newtype BshFunctionDef = BshFunctionDef String


-- data BshFunction = BshFunction {fn :: BshFunctionName, fd:: BshFunctionDef}

{-
instance Bsh BshTable where
   initBshTable (BshFunctionName fn) (BshFunctionDef fd) = BshTable fn fd
-}

-- initBshTable :: IO (HashTable BshFunctionName BshFunctionDef)

-- defBshFunction :: IO (BshFunction String String)

-- defBshFunction = "test" "test"


---------- class definitions
class Bsh bsh where
   -- initBshTable :: () -> BshTable
   -- addToBshTable :: (BshTable bt BshFunctionName fn, BshFunctionDef fd) -> BshTable
   

---------- main function
main :: IO ()
main = runInputT defaultSettings loop
   where
       loop :: InputT IO ()
       loop = do
           minput <- getInputLine "% "
           case minput of
               Nothing -> return ()
               Just "q" -> return ()
               Just input -> do outputStrLn $ "echo: " ++ input
                                loop

