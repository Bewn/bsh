{-# OPTIONS_GHC -Wno-unused-top-binds #-}

module BshLib (initBshFnc) where

import qualified Data.HashTable.IO as H

type BshTable k v = H.CuckooHashTable k v 

newtype BshFnName = BshFnName {n :: String}
newtype BshFnDef  = BshFnDef {d :: String}

data BshFunction = BshFunction {fn :: BshFnName, fd :: BshFnDef}


someFunc :: IO ()
someFunc = putStrLn "someFunc"


initBshFnc :: BshFnName -> BshFnDef -> BshFunction
initBshFnc n d = BshFunction n d

