data Tree a = Leaf a | Branch (Tree a) (Tree a) deriving Show
--NO VEO COMO UTILIZAR LA INSTANCIA FUNCTOR EN ESTE MAP. ME FALTA ALGO 
--PARA PASAR "EXTRA DATA".
--TAMPOCO VEO PORQUE UPDATE DEVUELVE TUPLAS, HAY ALGO Q NO ESTOY ENTENDIENDO!
--Y LA DUDA PRINCIPAL ES EL ÚLTIMO APARTADO Q NO ME SALIO.

--Numera las hojas de izquierda a derecha
numTree :: Tree a -> Tree Int
numTree t = fst (mapTreeNro update t 0)
	where update a n = (n,n+1)
	
	
	
-- recibe una función que, dada una hoja y el valor Int que me pasan como argumento,
-- genera un nuevo valor para la hoja y un nuevo Int para la llamada siguiente.


mapTreeNro                     :: (a->Int -> (b,Int)) -> Tree a -> Int -> (Tree b, Int)
mapTreeNro u (Leaf a) n        = let (b,n') = u a n in (Leaf b, n')
mapTreeNro u (Branch l r) init = (Branch l' r',nr)
        where (l',nl) = mapTreeNro u l init
	      (r',nr) = mapTreeNro u r nl


-----------------------------------------------------------------------------
--GENERALIZACIÓN DE (a), en vez de un Int, llevamos un state s
--mapTreeSt :: (a → s → (b, s)) → Tree a → s → (Tree b, s)
-- MEJOR OPCIÓN: USAR LA MÓNADA DEL EJ 3.


newtype State s a = St {runState :: s -> (a,s) }
instance Monad (State s) where
	return x     = St (\e -> (x,e))
	(St h) >>= f = St (\s -> let (x,s') = h s 
				 in   runState (f x) s' )

set   :: s -> State s ()
set e = St (\e -> ( () , e) )

get   :: State s s
get   = St (\e -> (e,e))



mapTreeM :: (a -> State s b) -> Tree a -> State s (Tree b) --cómo comunico estados..?
mepTreeM u (Leaf a)      = do --set s
                               x <- u a 
                               return (Leaf x)
mapTreeM u (Branch l r)  = do --set s
                               l' <- mapTreeM u l
                               r' <- mapTreeM u r
                               return (Branch l' r')





