module Parse2 where

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


--¿Cómo me doy cuente del órden en que chequeo? Eso me cambia todo y debería ser conmutativo...

--La gramática es la misma, pero el árbol es distinto... cuando desambiguo, 
--siempre asocia a derecha, porque voy sacando por izquierda.


--EJERCICIO 8

expr   :: Parser Int
expr   = do t <- term
            (op,e) <- expr'
            return (makeop t op e)


makeop :: Int -> Op -> Int -> Int
makeop n1 op n2 = case op of '+' -> n1+n2
                             '-' -> n1-n2
                             '*' -> n1*n2
                             '/' -> (div n1 n2)
                             'e' -> n1
        
expr' :: Parser (Op,Int)
expr' = do { char '+' ;  t<-term ; (op,e)<-expr' ; return ('+',makeop t op e)}
        <|> do { char '-' ; t<-term ; (op,e)<-expr' ; return ('-',makeop t op e)}
        <|> return ('e',0)



term   :: Parser Int
term   = do f <- factor 
            (op,e) <- term'
            return (makeop f op e)

term' :: Parser (Op,Int)
term' = do { char '*' ; f<- factor ; (op,t)<-term' ; return ('*',makeop f op t) }
        <|> do {char '/' ; f<-factor ; (op,t)<-term' ; return ('/',makeop f op t)}
        <|> return ('e',0)


factor :: Parser Int
factor = nat <|> do {char '(' ; e <- expr ; char ')' ; return e} 


eval :: String -> Int
eval xs = fst (head (parse expr xs) ) 





