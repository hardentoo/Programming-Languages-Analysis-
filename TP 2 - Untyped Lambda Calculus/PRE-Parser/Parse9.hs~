module Parse9 where

import Parsing
import Data.Char
import Control.Monad
import Control.Applicative hiding (many)
import AST

term :: Parser Term
term = do { symbol "/" ;
            id <- idents;
            symbol ".";
            t <- term ;
            return (Abs id t) }
        <|> do { n <- no_abs ; return (NoAbs n)}

no_abs :: Parser No_abs
no_abs = do { l <- leftap ; space ; r <- rightap ; return (App l r) }  
         <|> do { a<-atom ; return (At a)}


--  L := L A | A
--  Resolviendo la recursión a izquierda
--  L := A L'
--  L':= A L' | e
{-
parser malo, cuando la producción era L := A L | e
leftap :: Parser Leftap
leftap = do {a <- atom ; char ' ' ; space ;  as <-leftap ; (return (AtomL a as))}
         <|> (return Nil)

leftap "x y z" tiene que dar (AtomL (AToml (Ats x) y) z) 
leftap "a b c d e"                    AtomL( AToml (...) d ) e
-}

leftap :: Parser Leftap
leftap = do {x <- atom ; f <- leftap' ; return (f (Ats x)) }


leftap' :: Parser (Leftap -> Leftap)
leftap' = do {char ' ' ; space ; y <-atom ; f <- leftap' ; return  (\t -> f (AtomL t y)) } 
         <|> return id

rightap :: Parser Rightap
rightap = do { symbol "/" ; i<- idents ; symbol "." ; t <- term ; return (AbsR i t) }
          <|> return Nil

atom :: Parser Atom
atom = do { space ; i <- ident ; return (Var i)} <|> do { symbol "("; t <- term ; space ; char ')'; return (Atom_term t)}
-- ojo con poner "symbol ")"" porque te come los espacios del final
idents :: Parser Idents
idents = do  {i <- identifier; 
             do { is <- idents ; return (Vs i is) } <|> return (V i)
             }
