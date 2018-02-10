module Parse9 where

import Parsing
import Data.Char
import Control.Monad
import Control.Applicative hiding (many)
import AST


declaracion :: Parser Declaracion
declaracion = do t <- ctype
                 d <- declarador
                 char ';'
                 return (t,d)

ctype :: Parser Tipo
ctype = do { symbol "Int" ; return CInt } 
        <|> do { symbol "Char" ; return CChar }
        <|> do { symbol "Float" ; return CFloat } 


declarador :: Parser Declarador
declarador = do { char '*' ; t<-declarador ; return (Puntero_a t) } 
             <|> do { t<- declarador_directo ; return (D t) } 



--declarador_directo :: Parser Declarador_directo
--declarador_directo = do { s <- identifier ; return (Ident s) } 
--                   <|> do { char '(' ; d<-declarador_directo ; char ')' ; return d }  
--                   <|> do { d<- declarador_directo ; char '[' ; s<-int;  char ']' ; return (Arr d s) }



--Aquí está la recursión a izquierda
-- D -> D [C] | (D) | I
-- lo transformo en 
-- D -> (D) D' | I D' (duda: los parentesis no se guardan, se toman como implicitas una vez q se arma el árbol)
-- D'-> [C] D' | e (La duda: e se chequea siempre última?)


declarador_directo :: Parser Declarador_directo2
declarador_directo = do { char '(' ; d <-declarador_directo ; char ')' ; return d } 
                     <|> do { i <- ident ; d <-declarador_directo' ; return (Decl i d) }

declarador_directo' :: Parser Algo
declarador_directo' = do {char '['; n <- int ; char ']' ; d<-declarador_directo' ; return (Sz d n)} 
                      <|> (return Fin)



--Parsing> parse declaracion "Int c [4]"
--[((CInt,D (Ident "c")),"[4]")]




