module Parse10 where

import Parsing
import Data.Char
import Control.Monad
import Control.Applicative hiding (many)
import AST


{-El no terminal inicial sería Comm

C ::= 'skip' 
      | V ':=' I 
      | C ';' C 
      | 'if' B 'then' C 'else' C end 
      | 'while' B 'do' C 'end'

B ::= 'true' | 'false'
      | I '=' I  # Y así con > <
      | B '&' B  # Y ASI CON OR
      | '~' B
      | '(' B ')'

I ::= N | V | '-' I | I '+' I | '(' I ')' # - * / análogos a +


--RESOLVIENDO LA RECURSIÓN A IZQUIERDA:
--A -> Aa1 | Aa2 | ... | Aan | b1 | b2 .. | bn

--A -> b1A' | b2A' | ... | bnA'
--A' -> e | a1 A' | ... | an A' 

C ::= 'skip' C'
      | V ':=' I C'
      | 'if' B 'then' C 'else' C end C'
      | 'while' B 'do' C 'end' C'
C'::= ';' C C' | e

B ::= 'true' B' | 'false' B' | '~' B B' | '(' B ')' B' | I < I B'
B'::= '&' B B' | '|' B B' |e      

I := N I' | V I' | '-' I I'
I':= '+' I I' | ... | '/' I I' | e


-}

comando :: Parser Comm 
comando = do { symbol "skip" ; f <- comando' ; return (f Skip) }
          <|> do { v <- identifier ; symbol ":=" ; n <- intexp ; f <- comando' ; return (f (Let v n))}
          <|> do { symbol "if" ; b <- boolexp ; symbol "then" ; c1 <- comando ; symbol "else" ; c2 <- comando ; symbol "end" ; f <- comando' ; return (f (Cond b c1 c2)) }
          <|> do { symbol "while" ; b<-boolexp ; symbol "do" ; c <- comando ; symbol "end" ; f <- comando' ; return (f (While b c) ) }

comando' :: Parser (Comm -> Comm)
comando'  = do { symbol ";" ; c <- comando ; f<- comando' ; return (\c0 -> (Seq c0 (f c))) }
            <|> return id

boolexp :: Parser BoolExp
boolexp =  do { symbol "true" ; f <- boolexp' ; return (f BTrue )}
           <|> do {symbol "false" ; f<-boolexp' ; return (f BFalse)}
           <|> do {symbol "~" ; b <- boolexp ; f <- boolexp' ; return (f (Not b))}
           <|> do {symbol "(" ; b <- boolexp ; symbol ")" ; f <-boolexp' ; return (f b)}
           <|> do {i1 <- intexp ; symbol "=" ; i2 <- intexp ;  f<-boolexp' ; return (f (Eq i1 i2))}
           <|> do {i1 <- intexp ; symbol ">" ; i2 <- intexp ;  f <- boolexp' ; return (f (Gt i1 i2)) }
           <|> do {i1 <- intexp ; symbol "<" ; i2 <- intexp ;  f <- boolexp' ; return (f (Lt  i1 i2)) }  


boolexp' :: Parser (BoolExp -> BoolExp)
boolexp' = do {symbol "&" ; b <- boolexp ; f <- boolexp' ; return (\b0 -> (And b0 (f b))) }
           <|> do {symbol "|" ; b <- boolexp ; f <- boolexp' ; return (\b0 -> (Or b0 (f b))) }
           <|> return id
            
--I := N I' | V I' | '-' I I'
--I':= '+' I I' | ... | '/' I I' | e

intexp :: Parser IntExp
intexp = do { n <- integer ; f <- intexp' ; return (f (Consta n))} 
         <|> do { i <- identifier ; f <- intexp' ; return (f (Var i))}
         <|> do { symbol "-" ;  i<-intexp ; f <- intexp' ; return (f (UMinus i))}


intexp' :: Parser (IntExp -> IntExp)
intexp' = do {symbol "+" ; b <- intexp ; f <- intexp' ; return (\b0 -> (Plus b0 (f b))) }
          <|> do {symbol "-" ; b <- intexp ; f <- intexp' ; return (\b0 -> (Minus b0 (f b))) }
          <|> do {symbol "*" ; b <- intexp ; f <- intexp' ; return (\b0 -> (Times b0 (f b))) }
          <|> do {symbol "/" ; b <- intexp ; f <- intexp' ; return (\b0 -> (Div b0 (f b))) }
          <|> return id
            
--duda parcial: tenemos q ir sabiendo las funciones d parseo, nos las van a decir, o q
-- tipo si uno no se acuerda si x funcion consume los espacios blancos o no, etc

parser :: String -> Comm
parser s = fst (head (parse comando s))


