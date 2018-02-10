import Control.Exception (catch,IOException)
 
import Control.Monad.Except
-- En lugar Control.Monad.Except, en versiones viejas de GHC usar
--  import Control.Monad.Error 

import Data.Char
import Data.List
import Data.Maybe
import Prelude hiding (print, catch)
import System.Console.Readline
import System.Environment
import System.IO hiding (print)
import Text.PrettyPrint.HughesPJ (render,text)


ahorcado :: IO ()
ahorcado = do putStrLn "Piense una palabra"
              palabra <- sgetLine
              putStrLn "Intente adivinarla:"
              adivina palabra


sgetLine :: IO String
sgetLine = do hSetEcho stdin False
              palabra <- sgetLine'
              hSetEcho stdin True
              return palabra


sgetLine' :: IO String
sgetLine' = do c <- getChar
               if c=='\n' then do putChar c
                                  return []
               else do putChar '_'
                       xs <- sgetLine'
                       return (c:xs)
adivina :: String -> IO ()
adivina palabra = do putStr "> " 
                     xs <- getLine
                     if xs == palabra 
                        then putStrLn "Esa es la palabra!"
                        else do putStrLn (diff palabra xs)
                                adivina palabra

diff :: String -> String -> String 
diff xs ys = [if elem x ys then x else '_' | x <- xs] 

hola :: IO ()
hola = putStrLn "Hola mundo!"



