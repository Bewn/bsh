{-# OPTIONS_GHC -Wno-unused-top-binds #-}

module BshLib (someFunc) where

import qualified Data.HashTable.IO as H

type BshTable k v = H.CuckooHashTable k v 

newtype BshFnName = BshFnName {n :: String}
newtype BshFnDef  = BshFnDef {d :: String}

data BshFunc = BshFunc {fn :: BshFnName, fd :: BshFnDef}


someFunc :: IO ()
someFunc = putStrLn "someFunc"


