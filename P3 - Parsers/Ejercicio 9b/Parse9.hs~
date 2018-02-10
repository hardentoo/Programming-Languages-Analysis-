module Parse9 where

import Parsing
import Data.Char
import Control.Monad
import Control.Applicative hiding (many)
import AST


-- LA GRAMÁTICA SIN RECURSION A IZQ ES:

-- S -> T  D ;
-- T -> 'int'|'char'|'float'
-- D -> * D  | DD
-- DD -> (D) E | I E
-- E -> e | [ number ] E


declaration :: Parser Declaration
declaration = do { t<-ctype ; d<-declarator ; char ';' ; return (Decl t d) } 



ctype :: Parser Ctype
ctype = do { symbol "Int" ; return CInt } 
        <|> do { symbol "Char" ; return CChar }
        <|> do { symbol "Float" ; return CFloat } 


declarator :: Parser Declarator
declarator = do { char '*'; d<-declarator; return (Pointer_to d)}
             <|> direct_declarator

direct_declarator :: Parser Declarator
direct_declarator = do { char '(' ; d<-direct_declarator ; char ')' ; s <- auxiliar ; return (fusionar d s) }
                    <|> do { i<- identifier ; s <- auxiliar ; return (D i s) }

auxiliar :: Parser Size 
auxiliar = do { char '[' ; i <- integer; char ']'; e <- auxiliar ; return (Arr i e) }
           <|> return Nil


fusionar :: Declarator -> Size -> Declarator
fusionar (D xs Nil) sz2 = D xs sz2
fusionar (D xs (Arr i sz1)) sz2 = D xs (Arr i (merge sz1 sz2))

merge :: Size -> Size -> Size
merge Nil s = s
merge (Arr i sz) sz2 = Arr i (merge sz sz2) 

eval :: String -> Declaration
eval xs = fst ( head (parse declaration xs))


--A -> Aa1 | Aa2 | ... | Aan | b1 | b2 .. | bn

--A -> b1A' | b2A' | ... | bnA'
--A' -> e | a1 A' | ... | an A' 

