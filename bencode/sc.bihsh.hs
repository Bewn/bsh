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

type HashTable k v = Ht.CuckooHashTable k v



{-
main :: IO ()
main = T.writeFile "hello.sh" $ script $ do
   cmd "echo" "hello, world"
   username <- newVarFrom (Output (cmd "whoami")) ()
   cmd "echo" "from" (WithVar username (<> "'s shell"))
-}

----------- type definitions

-- data BshFunction = BshFunction {fn :: BshFunctionName, fd:: BshFunctionDef}

{-
instance Bsh BshTable where
   initBshTable (BshFunctionName fn) (BshFunctionDef fd) = BshTable fn fd
-}



---------- class definitions
class  Bsh bsh where
    -- initBshTable :: () -> BshTable
    -- initBshTable = initHashTable
   -- addToBshTable :: (BshTable bt BshFunctionName fn, BshFunctionDef fd) -> BshTable

newtype BshFuncName  = BshFuncName String
newtype BshFuncDef   = BshFuncDef String
data    BshFunc      = BshFunc { fn :: BshFuncName, fd :: BshFuncDef }


{-
instance Bsh BshFunc where
    bsh bshf = do bshf 

instance Bsh BshTable where
    bsh bshtbl = initBshTable
-}

---------- main function
main :: IO ()
main = runInputT defaultSettings loop where
    loop    :: InputT IO ()
    loop = do
       minput <- getInputLine "bsh%λ"
       case minput of
          Nothing     -> return ()
          Just "q"    -> return ()
          Just input  ->  do outputStrLn $ "echo: " ++ input
                             loop

