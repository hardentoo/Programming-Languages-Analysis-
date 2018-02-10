----------------------------------- EJERCICIO 7.A ------------------------------------------
sequence' :: Monad m => [m a] -> m [a]
sequence' []     = return []
sequence' (e:es) = do x  <-  e
                      xs <- sequence' es
                      return (x:xs)
------------------------------------EJERCICIO 7.B ------------------------------------------
liftM     :: Monad m => (a -> b) -> m a -> m b
liftM f m = do e <- m
               return (f e)

--que debería coincidir con fmap f m

------------------------------------EJERCICIO 7.C ------------------------------------------

liftM2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
liftM2 f ma mb = do ea <- ma
                    eb <- mb 
                    return (f ea eb)

{- Instancia de listas 


instance Monad [] where
    return x = [x]
    xs >>= f = concat (map f xs)



        liftM2 AND [tre,false] [true,false]

        [true,false] >>= (\b -> [true,false] >>= (\b' -> [b AND b']))

        [true,false] >>= (\b -> concat (map (\b' -> [b AND b']) [true,false]) )

        [true,false] >>= (\b -> concat ([[b AND true], [b AND false]]) )
        

        [true,false] >>= (\b -> [b AND true, b AND false])

        concat (map (\b -> [b AND true, b AND false]) [T,F])

        concat ( [ [T and T, T and F] , [F and T,F and F] ] )

        [T and T, T and F, F and T, F and F]


-}

------------------------------------EJERCICIO 7.D-------------------------------------------



sequence'' :: Monad m => [m a] -> m [a]
sequence'' = foldr (liftM2 (++)) []


