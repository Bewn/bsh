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

type HashTable k v = Ht.BasicHashTable k v

main :: IO ()
main = putStrLn "hello bish"
  initializeInput defaultSettings loop
     where
       loop :: InputT IO ()
         loop = do 
            minput <- getInputLn "% "
            case minput of
               Nothing -> return ()
               Just "quit" -> return ()
               Just input -> outputStrLn input
                  loop
  



