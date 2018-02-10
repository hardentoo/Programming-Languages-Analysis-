data Error er a = Raise er | Return a deriving Show

instance Monad (Error er) where
        return x       = Return x
        Raise e  >>= f = Raise e
        Return a >>= f = f a

{- 
(monad.1) 

        return x >>= f
= < def de return >
        Return x >>= f
= < def de >>= >
        f x

(monad.2)
        Raise e >>= return
= <def de >>=>
        Raise e

        Return a >>= return
=<def de >>=>
        return a
=< def de return >
        Return a

(monad.3)

        (Raise err >>= f ) >>= g
=< doble definicion de >>=>
        Raise err
=< def de >==>
        Raise err >>= (choclo)



        (Return a >>= f) >>= g
=<def de >>= >
        f a >>= g
=<def de >>=>
        Return a >>= (\x -> f x >>= g)

por lo tanto es una mónada                           -}

head'        :: [a] -> Error String a
head' []     = Raise "lista vacia"
head' (x:xs) = Return x 

tail'        :: [a] -> Error String [a]
tail' []     = Raise "lista vacia"
tail' (x:xs) = Return xs

data Stack a = N | E a (Stack a) deriving Show

push :: a -> Stack a -> Error String (Stack a)
push e st = Return (E e st)

pop :: Stack a -> Error String (Stack a)
pop N = Raise "Pila vacia"
pop (E a s) = Return s
