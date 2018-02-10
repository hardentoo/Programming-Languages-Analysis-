
module Untyped where

import Data.List
import Text.ParserCombinators.Parsec
import Text.Parsec.Token
import Text.Parsec.Language
import PrettyPrinter

import Common


type Ident = String           --Para el parser
type Entorno = [(String,Int)] --Para ejercicio 3

------------------------
-- Ejercicio 1
------------------------

num :: Integer -> LamTerm
num n = Abs "s" (Abs "z" (generate n))
        where generate 0 = LVar "z"
              generate k = App (LVar "s") (generate (k-1))

-----------------------
--- Sección 2 Parsers
-----------------------

totParser :: Parser a -> Parser a
totParser p = do 
                  whiteSpace untyped
                  t <- p
                  eof
                  return t

-- Analizador de Tokens
untyped :: TokenParser u
untyped = makeTokenParser (haskellStyle { identStart = letter <|> char '_',
                                          reservedNames = ["def"] })

 
-- Parser para comandos
parseStmt :: Parser a -> Parser (Stmt a)
parseStmt p = do
          reserved untyped "def"
          x <- identifier untyped
          reservedOp untyped "="
          t <- p
          return (Def x t)
    <|> fmap Eval p

 
parseTermStmt :: Parser (Stmt Term)
parseTermStmt = fmap (fmap conversion) (parseStmt parseLamTerm)

-- Parser para LamTerms 


parseLamTerm :: Parser LamTerm
parseLamTerm = abst <|> noAbs

abst :: Parser LamTerm
abst = do {symbol untyped "\\" ;
           idents <- many1 (identifier untyped);
           symbol untyped "." ;
           t <- parseLamTerm;
           return (formAbsTerm idents t)}

noAbs :: Parser LamTerm
noAbs = do{ lA <- leftApp;
            try( do{abstraccion <- abst; return (App lA abstraccion)} ) <|> return lA  }

leftApp :: Parser LamTerm
leftApp = do { as <- many1 atom; return (formAppTerm as) } 

atom :: Parser LamTerm
atom = try( parens untyped parseLamTerm ) 
       <|> do{ var <- identifier untyped; return (LVar var)} 
       <|> do{ n <- integer untyped; return (num n) } 
formAppTerm :: [LamTerm] -> LamTerm
formAppTerm [t] = t
formAppTerm ts = App (formAppTerm (init ts)) (last ts)

formAbsTerm :: [Ident] -> LamTerm -> LamTerm
formAbsTerm [] term = term
formAbsTerm (i:is) term = Abs i (formAbsTerm is term)


-- conversion a términos localmente sin nombres

conversion  :: LamTerm -> Term
conversion l = conversion' l []

conversion' :: LamTerm -> Entorno -> Term
conversion' (LVar var)  e = find' var e
conversion' (App t1 t2) e = (conversion' t1 e) :@: (conversion' t2 e)
conversion' (Abs var t) e = Lam (conversion' t e')
	where e'= update var e


find' :: String -> Entorno -> Term
find' var []              = Free (Global var)
find' var ((nombre,n):es) | var==nombre  = Bound n
                          | otherwise    = find' var es

update :: String -> Entorno -> Entorno
update var []         = [(var,0)]
update var ((v,n):es) | var==v    = update var es
                      | otherwise = (v,n+1):(update var es)

-- para testear el parser interactivamente.
testParser :: Parser LamTerm
testParser = totParser parseLamTerm                                    

-------------------------------
-- Sección 3
-------------------------------

vapp :: Value -> Value -> Value

vapp (VLam f) n                 = f n 
vapp (VNeutral n) t2            = VNeutral (NApp n t2)

 
eval :: [(Name,Value)] -> Term -> Value
eval  e t = eval' t (e,[])


-- type NameEnv v = [(Name, v)] definido arriba

eval' :: Term -> (NameEnv Value,[Value]) -> Value
eval' (Lam t)     (e,xs)  =  VLam (\v-> eval' t (e,  v:xs ) )

eval' (t1 :@: t2)  d     = vapp v1 v2
        where v1 = eval' t1 d 
              v2 = eval' t2 d
        -- Haskell se encarga de que esto se haga en forma normal
        -- Por ejemplo (\x.z) ((\x. x x) (\x. x x)) termina (aunque
        -- viendo el código pareciera que no)

eval' (Bound  ii)  d      =  (snd d) !! ii
eval' (Free name)  d      | null xs    = VNeutral (NFree (name))
                          | otherwise  = head xs
        where xs = [v |  (n,v) <- fst d , n==name] --Asumimos que el nombre esta
--una sola vez en la lista, a lo sumo.




-------------------------------
-- Sección 4
-------------------------------

quote  :: Value -> Term
quote  =  quote' 0

quote' :: Int -> Value -> Term      -- el entero es el contador de la proxima variable fresca
quote' n (VNeutral (NFree (Quote k)))      = Bound (n-k-1)
quote' n (VNeutral (NFree name))           = Free name
quote' n (VNeutral (NApp neutral value ) ) = (quote' n (VNeutral neutral)) :@: (quote' n value) 
quote' n (VLam f)                          = let res = f (VNeutral (NFree (Quote n))) in (Lam (quote' (n+1) res) )






