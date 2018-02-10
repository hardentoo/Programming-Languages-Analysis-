module Parse8 where

import Parsing
import Data.Char
import Control.Monad
import Control.Applicative hiding (many)
import AST

type Op = Char

-- La gramática sin recursión a izquierda sería 

-- E  -> T E'
-- E' -> "+" T E'| "-" T E' | e
-- T  -> F T'
-- T' -> * F T'| % F T' | e
-- F  -> D | ( E ) 


--Cómo me doy cuente del órden en que chequeo? Eso me cambia todo y debería ser conmutativo...

--EJERCICIO 8

expr   :: Parser Int
expr   = do t <- term
            f <- expr'
            return (f t)


expr' :: Parser (Int -> Int)
expr' = do { char '+' ; n <- term ; f <- expr' ; return ( f.(+n) )}
        <|> do { char '-' ; n <- term ; f<- expr' ; return (f.(rest n))}
        <|> return id 
                where rest m k = k - m

term   :: Parser Int
term   = do n <- factor 
            f <- term'
            return (f n)

term' :: Parser (Int -> Int)
term' = do {char '*' ; n<-factor ; f<-term' ; return ( f.(*n) ) }
        <|> do { char '/' ; n<-factor ; f<-term' ; return ( f . (dividir n) )}
        <|> return id
                where dividir m k = div k m


factor :: Parser Int
factor = nat <|> do {char '(' ; e <- expr ; char ')' ; return e} 


eval :: String -> Int
eval xs = fst (head (parse expr xs) ) 





