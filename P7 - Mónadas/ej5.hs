--RECORDATORIO: ANTES DE IMPRIMIR, DESCOMENTAR LA INSTANCIA DE MONADA DE B

{-En álgebra abstracta, un monoide es una estructura algebraica con una operación binaria, 
que es asociativa y tiene elemento neutro,-}

--------------------------------------APARTADO A--------------------------------------------

class Monoid m where
	mempty   :: m           -- el neutro
	mappend  :: m -> m -> m -- la operación binaria asociativa
	

instance Monoid [a] where  --se queja si pones String o [Char]
	mempty = []
	mappend = (++)
	
{-
	supongo la implementación
	
	[] ++ ys     = ys
	xs ++ []     = xs
	(x:xs) ++ ys = x: (xs ++ ys)


(monoid.1)  para todo xs :: String ; xs ++ [] = [] ++ xs = xs
        Inmediato de la definición de ++
	
(monoid.2)  xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

Inducción estructural en xs

 Caso base:  [] ++ (ys ++ zs) = ys ++ zs = ([] ++ ys) ++ zs
 
 Paso inductivo :  xs = w:ws;
	vale HI:  ws ++ (ys ++ zs) = (ws ++ ys) ++ zs


	w:ws ++ (ys ++ zs)
  = < def de ++ >
    w: (ws ++ (ys++zs))
  = <HI>
	w: ((ws ++ ys) ++ zs)
  =< def de ++>
   (w:(ws ++ ys))  ++ zs
  = <def de ++>
  ( (w:ws) ++ ys) ++ zs                                                                  -}
-----------------------------------------APARTADO B-----------------------------------------

newtype Output w a = Out (a,w) deriving Show

fsto (Out (a,w))   = a
sndo (Out (a,w))   = w



--instance Monoid w => Monad (Output w) where
--        return x         = Out (x,mempty)
--        Out (a,w) >>= f  = let (Out (a',w')) = f a in Out (a',mappend w w') 


{-  e: neutro , +: operacion binaria de la mónada w

  (monad.1) 

        return x >>= f
=< def de return >
        Out (x,e) >>= f
=< def de >>= >
        let (Out (a',w')) = f x in Out (a', e + w')
=< e es neutro >
        let (Out (a',w')) = f x in Out (a',w')
=< obviedad >
        f x

  (monad.2)

        Out (a,w) >>= return
=< def de >>= >
        let (Out (a',w')) = return a in Out (a',w + w')
=< def de return >
        let (Out (a',w')) = (Out (a,e)) in Out (a', w + w')
=< evaluacion del let >
        Out (a, w + e)
=< e es neutro >
        Out (a,w)


   (monad.3)

        (Out (a,w) >>= f) >>= g
= < def de >>= >
        (let Out (a',w') = f a in Out (a', w + w') ) >>=g
= < * >
        (let Out (a',w') = Out (k,kw) in Out (a', w + w') ) >>=g
= < evaluacion de let >
        Out (k, w + kw) >>= g
= < def de >>=  >
        let Out (k',w') = g k in Out (k', (w + kw) + w') 
= < * >
        let Out (k',w') = Out (y,yw) in Out (k', (w + kw) + w') 
= < evaluacion de let >
        Out (y, (w + kw) + yw)
= < + es asociativa >
        Out (y, w + (kw + yw))
=  <evaluación de let >
        let Out (b',z') = Out (y, kw + yw) in Out (b',w + z')
= < evaluacio de let > 
        let Out (b',z') = (let Out (k',w') = Out (y,yw) in Out (k', kw + w')) in Out (b', w + z')
= < * >
        let Out (b',z') = (let Out (k',w') = g k in Out (k', kw + w')) in Out (b', w + z')
= < def de >>= >
        let Out (b',z') = (Out (k,kw) >>=g) in Out (b', w + z')
= < * >
        let Out (b',z') = f a >>=g in Out (b', w + z')
= <def de >>= > 
        Out (a,w) >>= (\v -> f v >>= g)


*)  f a = Out (k,kw)
*)  g k = Out (y,yw)
                                                                                     -}
---------------------------------------APARTADO C-------------------------------------------

instance Monoid w => Monad (Output w) where
        return x         = Out (x,mempty)
        Out (a,w) >>= f  = let (Out (a',w')) = f a in Out (a',mappend w' w) 

{-  e: neutro , +: operacion binaria de la mónada w

  (monad.1) 

        return x >>= f
=< def de return >
        Out (x,e) >>= f
=< def de >>= >
        let (Out (a',w')) = f x in Out (a', w' + e)
=< e es neutro a derecha>
        let (Out (a',w')) = f x in Out (a',w')
=< obviedad >
        f x

  (monad.2)

        Out (a,w) >>= return
=< def de >>= >
        let (Out (a',w')) = return a in Out (a', w' + w)
=< def de return >
        let (Out (a',w')) = (Out (a,e)) in Out (a', w' + w)
=< evaluacion del let >
        Out (a, e + w)
=< e es neutro a izquierda>
        Out (a,w)


   (monad.3)

        (Out (a,w) >>= f) >>= g
= < def de >>= >
        (let Out (a',w') = f a in Out (a', w' + w) ) >>=g
= < * >
        (let Out (a',w') = Out (k,kw) in Out (a', w' + w) ) >>=g
= < evaluacion de let >
        Out (k, kw + w) >>= g
= < def de >>=  >
        let Out (k',w') = g k in Out (k', w' + (kw + w)) 
= < * >
        let Out (k',w') = Out (y,yw) in Out (k', w' + (kw + w)) 
= < evaluacion de let >
        Out (y, yw + (kw + w))
= < + es asociativa >
        Out (y, (yw + kw) + w)
=  <evaluación de let >
        let Out (b',z') = Out (y, yw + kw) in Out (b', z' + w)
= < evaluacio de let > 
        let Out (b',z') = (let Out (k',w') = Out (y,yw) in Out (k', w' + kw)) in Out (b', z' + w)
= < * >
        let Out (b',z') = (let Out (k',w') = g k in Out (k', w' + kw)) in Out (b', z' + w)
= < def de >>= >
        let Out (b',z') = (Out (k,kw) >>=g) in Out (b', z' + w)
= < * >
        let Out (b',z') = f a >>=g in Out (b', z' + w)
= <def de >>= > 
        Out (a,w) >>= (\v -> f v >>= g)


*)  f a = Out (k,kw)
*)  g k = Out (y,yw)                                                                    -}

---------------------------------------APARTADO D-------------------------------------------

write   :: Monoid w => w -> Output w ()
write w = Out ((),w)

---------------------------------------APARTADO E-------------------------------------------

data Exp = Const Int | Plus Exp Exp | Div Exp Exp deriving Show


evalM1          :: Exp -> Output String Int
evalM1 e@(Const n)  = do write (traza e n)
                         return n 
evalM1 e@(Plus t u) = do n0 <- evalM1 t
                         n1 <- evalM1 u
                         write (traza e (n0+n1))
                         return (n0+n1)
evalM1 e@(Div t u)  =do  n0 <- evalM1 t
                         n1 <- evalM1 u
                         write (traza e (n0 `div` n1))
                         return (n0 `div` n1)

traza :: Exp -> Int -> String
traza e n = "El termino " ++ show e ++ " tiene valor " ++  show n ++ "\n"

{-instance (Show a, Show b) => Show (Output a b) where
        show (Out (n,w)) = show' ls ++ "\n" ++ show n
                where ls = lines (show w)
                      show' [] = ""
                      show' (x:xs) = show x ++ "\n" ++ show' xs
-}
                      
eval :: Exp -> IO ()
eval e = let Out (i,s) = evalM1 e in putStrLn s >> (putStrLn $ show i)


{- por suerte lines ya esta en el prelude

lines :: String -> [String]
lines xs = lines' xs [] []

lines' :: String -> String -> String -> [String]
lines' []     _  acum = acum
lines' (x:xs) ys acum | x=='\n'   = lines' xs [] ( (reverse ys):acum)
                      | otherwise = lines' xs (x:ys) acum


-}








