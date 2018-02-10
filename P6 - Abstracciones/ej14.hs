-- VERSIÓN BERRETA MODIFICANDO EL PROGRAMA QUE DIO MAURO EN CLASE

import Prelude hiding (print, catch)
import System.IO hiding (print)


juego :: IO ()
juego    = do putStrLn "Piense un número"
              numero <- sgetLine
              putStrLn "Intente adivinarlo:"
              adivina (read numero)


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


adivina :: Int -> IO ()
adivina numero  = do putStr "> " 
                     n2 <- getLine -- NO PONER EL READ ACA! OJO!
                     if (read n2) == numero 
                        then putStrLn "Correcto!"
                        else do putStrLn (diff numero (read n2))
                                adivina numero

diff :: Int -> Int -> String 
diff n1 n2 = if n1<n2 then "Prueba con un número menor"
                      else "Prueba con un número mayor"

