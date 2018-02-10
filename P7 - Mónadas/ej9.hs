--Ruidos: para hacer la instancia monada preciso que sea num? monoide?
--Está bien esta instancia o me la complique innecesariamente? porque el ejercicio (c) 
--quedaría un cáos y no sé si es la idea


data T = Con Int | Div T T --Lenguaje de expresiones sencillo

data Error er a = Raise er | Return a deriving Show

instance Monad (Error er) where
        return x       = Return x
        Raise e  >>= f = Raise e
        Return a >>= f = f a

newtype M s e a = M {runM :: s -> Error e (a,s)}


instance (Num s) => Monad (M s e) where
        return a0 = M (\s -> Return (a0,0))
        M h >>= f = M (\s -> case h s of
                                Raise xs       -> Raise xs
                                Return (a0,s0) -> runM (f a0) s0  )


{- FALTA EL DETALLE DE PROBAR QUE ESTA INSTANCIA ES VÁLIDA! -}

raise :: e -> M s e a
raise xs = M (\s -> Raise xs)

modify   :: (s -> s) -> M s e ()
modify f = M (\s -> Return ( () , f s) ) 


eval             :: T -> M Int String Int
eval (Con n)     = return n
eval (Div t1 t2) = do v1 <- eval t1
                      v2 <- eval t2
                      if v2==0 then raise "Error: Division por cero."
                               else do modify (+1)
                                       return (v1 `div` v2)

doEval   :: T -> Error String (Int,Int)
doEval t = runM (eval t) 0
 
