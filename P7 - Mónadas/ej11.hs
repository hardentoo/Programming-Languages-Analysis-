
data M m a = Mk (m (Maybe a) ) 
run (Mk e) = e							
						
-- a :: *
-- Maybe a :: *
-- m :: * -> * 

{- m es una mónada, entonces tengo

	return :: a -> m a
	(>>=)  :: m a -> ( a -> m b) -> m b 

-}



instance (Monad m) => Monad (M m) where
	return a   = Mk ( return (Just a) )    --DUDA! COMO HAGO PARA INDICAR A QUE RETURN HAGO REFERENCIA?? --
	Mk e >>= f = Mk ( e >>= (\v  -> case v of
						Nothing  -> return Nothing
						(Just a) -> run (f a) ) )  
	--e :: m (Maybe a) , f :: a -> M m b 
        --                   f :: a -> Mk (m (Maybe b))

--------------------------------------------------------------------------------------------
throw :: (Monad m) => M m a
throw = Mk (return Nothing)
--------------------------------------------------------------------------------------------

data StInt a = St (Int -> (a,Int)) 
runState (St f) = f
type N a = M StInt a 



instance Monad StInt where
        return x   = St (\i -> (x,i))
        St h >>= f = St (\i -> let (a0,n0) = h i in runState (f a0) n0)
        -- f:: a -> StInt b
        -- h:: Int -> (a,Int)


get :: N Int -- M StInt a = Mk (StInt (Maybe a))
get = Mk (St (\i -> (Just i,i)) )

put   :: Int -> N ()
put n = Mk (St (\i -> (Just (),n)))





--------------------------------------------------------------------------------------------

data Expr = Var | Con Int | Let Expr Expr | Add Expr Expr | Div Expr Expr deriving Show

eval             :: Expr -> N Int
eval (Var)       = do st <- get
                      return st
eval (Con n)     = return n
eval (Let e1 e2) = do n1 <- eval e1 
                      put n1
                      eval e2
eval (Add e1 e2) = do n1 <- eval e1
                      n2 <- eval e2
                      return (n1+n2)
eval (Div e1 e2) = do n1 <- eval e1
                      n2 <- eval e2
                      if n2==0 then throw else return (div n1 n2)


eval' :: Expr -> (Maybe Int,Int)
eval' e = runState (run (eval e)) 0


exp2 = Add (Div ( Add Var (Con 12) ) (Let (Con 4) Var ) ) (Con 10)




