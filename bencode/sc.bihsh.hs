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
{-# LANGUAGE MultiParamTypeClasses #-}


import System.Console.Haskeline
   ( defaultSettings, getInputLine, outputStrLn, runInputT, InputT )
import Control.Concurrent ()

-- import HsShellScript

-- this is going to be a haskell based domain specific language for a functional shell
-- it will be called bsh because that's like bash and the aim is to replace bash

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
         Ht.insert bshtbl "name" "def"
         return bshtbl

{-}
   addToBshTable :: IO (BshTable BshFuncName BshFuncDef) -> BshTable
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

testFunc :: IO ()
testFunc = putStrLn "test bish"

----- |---------- main function------------------------------------------------|
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
