module PrettyPrinter (
       printTerm,     -- pretty printer para terminos
       printType,     -- pretty printer para tipos
       )
       where

import Common
import RealFc
import Text.PrettyPrint.HughesPJ

-- lista de posibles nombres para variables
vars :: [String]
vars = [ c : n | n <- "" : map show [1..], c <- ['x','y','z'] ++ ['a'..'w'] ]
              
parensIf :: Bool -> Doc -> Doc
parensIf True  = parens
parensIf False = id

-- pretty-printer de términos

pp :: Int -> [String] -> Term -> Doc
pp ii vs (Bound k)         = text (vs !! (ii - k - 1))
pp _  vs (Free (Global s)) = text s
pp ii vs (i :@: c) = sep [parensIf (isLam i) (pp ii vs i), 
                          nest 1 (parensIf (isLam c || isApp c) (pp ii vs c))]  
pp ii vs (Lam t c) = text "\\" <>
                     text (vs !! ii) <>
                     text ":" <>
                     printType t <>
                     text ". " <> 
                     pp (ii+1) vs c

pp ii vs (Hast e t) = pp ii vs e <>
                      text " as " <>
                      printType t
pp ii vs UT         = text "unit "

pp ii vs (Pairt l r) = parens (
                       (pp ii vs l) <>
                       text ","     <>
                       (pp ii vs r) )
pp ii vs (Sndt  e  ) = text "snd " <> 
                       (pp ii vs e)  
pp ii vs (Fstt  e  ) = text "fst " <> 
                       (pp ii vs e)  

                            
isLam (Lam _ _) = True
isLam  _      = False
   
isApp (_ :@: _) = True
isApp _         = False                                                               


-- pretty-printer de tipos
printType :: Type -> Doc
printType Base         = text "B"
printType (Fun t1 t2)  = sep [ parensIf (isFun t1) (printType t1), 
                               text "->", 
                               printType t2]
printType Unit         = text "Unit"
printType (Pair t1 t2) = text "("     <>
                       (printType t1) <>
                       text ","     <>
                       (printType t2) <>
                       text ")"

isFun (Fun _ _)        = True
isFun _                = False


fv :: Term -> [String]
fv (Bound _)         = []
fv (Free (Global n)) = [n]
fv (Free _)          = []
fv (t :@: u)         = fv t ++ fv u
fv (Lam _ u)         = fv u
fv (Hast e t)        = fv e
fv UT                = []
fv (Pairt  e1 e2)    = fv e1 ++ fv e2
fv (Fstt e)          = fv e   
fv (Sndt e)          = fv e

---
printTerm :: Term -> Doc 
printTerm t = pp 0 (filter (\v -> not $ elem v (fv t)) vars) t

