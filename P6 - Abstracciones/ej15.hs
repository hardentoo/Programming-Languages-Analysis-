-- PREGUNTAR COMO HACER ALGO DEL ESTILO TRY

import Prelude hiding (print, catch)
import System.IO hiding (print)

type Tablero = [Int]
type Jugador = Int
show_tablero :: Tablero -> IO ()
show_tablero [n1,n2,n3,n4,n5] = do putStr ((stars n1)++"\n")
                                   putStr ((stars n2)++"\n")
                                   putStr ((stars n3)++"\n")
                                   putStr ((stars n4)++"\n")
                                   putStr ((stars n5)++"\n")
                                   return ()
stars :: Int -> String
stars 0 = []
stars n = '*':(stars (n-1))


nim :: IO ()
nim = nim' [5,4,3,2,1] 1


nim' :: Tablero -> Jugador -> IO ()
nim' t j = do   show_tablero t
                putStrLn ( "Turno del jugador "++(show j) )
                putStrLn "De que fila desea quitar estrellas?"
                n <- getLine
                if not (elem (read n) [1..5] ) 
                        then  ( do {putStrLn "La fila debe estar entre 1 y 5. Vuelve a jugar." ; nim' t j })    
                        else putStrLn "Cuantas?"
                n2 <- getLine
                if read n2 < 0 || ( t!! (read n - 1) - read n2 <0 ) 
                        then  ( do {putStrLn "Cantidad no valida. Vuelve a jugar." ; nim' t j })    
                        else putStrLn ""
                nuevo_t <- realizar_jugada t (read n) (read n2) j
                if nuevo_t==[0,0,0,0,0] 
                             then do {putStrLn ("Gano el jugador "++show j) ; return () }
                             else  nim' nuevo_t (if j==1 then 2 else 1)

                
realizar_jugada :: Tablero -> Int -> Int -> Jugador -> IO Tablero
realizar_jugada t fila cantidad j = return (quitar t fila cantidad)

 -- | not (elem fila [1..5])   = do {putStr "La fila debe estar entre 1 y 5. Juega de nuevo" ; nim' t j}
                                  -- | t[fila-1] - cantidad < 0 || cantidad < 0  = do {putStr "Ingrese una cantidad válida" ; nim' t j}
                                  -- | otherwise                                 = return (quitar t fila cantidad)


quitar :: Tablero -> Int -> Int -> Tablero
quitar t fila cantidad =  [if n==fila then ((t!!(n-1))-cantidad) else t!!(n-1) | n<-[1..5] ]

