data Cont r a = Cont ((a->r) -> r)

ext :: Cont r a -> ((a->r) -> r)
ext (Cont h) = h


instance Monad (Cont r) where
	return a     = Cont ( \c -> c a )
	Cont h >>= f = Cont ( \g -> h (\a->  (ext (f a)) g ) ) 
		-- h :: (a->r) -> r
		-- f :: a -> Cont r b
		-- g :: b->r
		-- miembro derecho :: Cont r b

{-
(monad.1)  return x >>= f = f x

	return x >>= f
= < def de return >
	Cont (\c -> c x) >>=f
= < def de >> >
	Cont ( \g -> (\c -> c x) (\a->  (ext (f a)) g ) ) 
= < evaluación >
	Cont ( \g ->  (\a->  (ext (f a)) g ) x )
= < evaluación >
	Cont ( \g ->   (ext (f x)) g ) 
= < * y definición de ext >
	Cont ( \ g -> h g )
= < extensionalidad >
	Cont h 
= < * >
	f x 

f x :: Cont r b => f x = Cont h, h :: (b -> r) -> r


(monad.2) 
	Cont h >>= return 
= < def de >>= >
	Cont ( \g -> h (\a->  (ext (return a)) g ) ) 
= < def de return >
	Cont ( \g -> h (\a->  (ext (Cont (\c -> c a) )) g ) ) 
= < def de ext >
	Cont ( \g -> h (\a->  (\c -> c a) g ) ) 
= < app >
	Cont ( \g -> h (\a-> g a )) 	
= < extensionalidad >
	Cont ( \g -> h g )
= < extensionalidad >
	Cont h 
	
(monad.3)
	(Cont h >>= f )>>= g
= < def de >>= >
	Cont ( \g' -> h (\a->  (ext (f a)) g' ) ) >>= g
= < def de >>= >
	Cont ( \g'' -> ( \g' -> h (\a->  (ext (f a)) g' ) ) (\a'->  (ext (g a')) g'' ) ) 
= < app >
	Cont ( \g'' -> h (\a->  (ext (f a)) (\a'->  (ext (g a')) g'' ) )   ) 
= < * y def de ext >
	Cont ( \g'' -> h (\a->  fa (\a'->  (ext (g a')) g'' ) )   ) 
= < extensionalidad (cambio de variable ligada) >
	Cont ( \g' -> h (\a->  fa (\a'->  (ext (g a')) g' )   ) )	
= < app >
	Cont ( \g' -> h (\a->  ( \g' -> fa (\a->  (ext (g a)) g' ) )  g' ) )	
= < def de ext >
	Cont ( \g' -> h (\a->  (ext ( Cont ( \g' -> fa (\a->  (ext (g a)) g' ) ) )) g' ) )	
= < def de >>= >
	Cont ( \g' -> h (\a->  (ext ( Cont fa >>= g)) g' ) ) 	
= < * >	
	Cont ( \g' -> h (\a->  (ext ( f a >>= g)) g' ) ) 
= < app >
	Cont ( \g' -> h (\a->  (ext ((\v -> f v >>= g)  a)) g' ) ) 	 
= < def de >>= >
	Cont h >>= (\v -> f v >>= g)  


* ) f a = Cont fa



-}

