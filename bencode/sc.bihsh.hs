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

{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}

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

{-
main :: IO ()
main = T.writeFile "hello.sh" $ script $ do
   cmd "echo" "hello, world"
   username <- newVarFrom (Output (cmd "whoami")) ()
   cmd "echo" "from" (WithVar username (<> "'s shell"))
-}

----------- type definitions

{-
instance Bsh BshTable where
   initBshTable (BshFunctionName fn) (BshFunctionDef fd) = BshTable fn fd
-}

---------- class definitions
class Bsh where
   initBshTable :: IO (BshTable String String)
   initBshTable  =
      do bshtbl <- Ht.new
         Ht.insert bshtbl "main" "True"
         return bshtbl

{-}
   addToBshTable :: IO ( BshTable BshFuncName BshFuncDef)
   addToBshTable =
      do
         Ht.insert bshtbl BshFuncName BshFuncDef
         return bshtbl
         -}

   -- addToBshTable :: (BshTable bt BshFunctionName fn, BshFunctionDef fd) -> BshTable

newtype BshFuncName  = BshFuncName { bshFnN :: String }
newtype BshFuncDef   = BshFuncDef { bshFnDefn :: String }
data    BshFunc      = BshFunc { n :: BshFuncName , d :: BshFuncDef }
type    BshTable n d = Ht.CuckooHashTable n d

{-
instance Bsh BshFunc where
    bsh bshf = do bshf 

instance Bsh BshTable where
    bsh bshtbl = initBshTable
-}

---------- main function
main :: IO ()
main =  runInputT defaultSettings loop where
     loop        :: InputT IO ()
     loop         = 
      do  minput <- getInputLine "bsh%λ"
          case  minput
            of Nothing     -> return ()
               Just "q"    -> return ()
               Just "def"  -> do 
                  inln <- getInputLine "name the function\n"
                  case inln 
                    of Nothing   -> return ()
                       Just inp  -> do outputStrLn $ "" ++ inp
                                       loop
               Just input   ->  do outputStrLn $ "echo: " ++ input
                                   loop
