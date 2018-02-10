data Exp = Const Int | Plus Exp Exp | Div Exp Exp

--------------------------------------------------------------------------------------
------------------- EVALUADOR SIMPLE SIN MANEJO DE ERRORES----------------------------

eval1            :: Exp -> Int
eval1 (Const n)  = n
eval1 (Plus t u) = eval1 t + eval1 u
eval1 (Div t u)  = eval1 t `div` eval1 u

newtype Id a = Id a deriving Show

runId :: Id a -> a
runId (Id a) = a

instance Monad Id where
        return x     = Id x
        (Id a) >>= f = f a

evalM1          :: Exp -> Id Int
evalM1 (Const n)  = return n 
evalM1 (Plus t u) = do n0 <- evalM1 t
                       n1 <- evalM1 u
                       return (n0+n1)
evalM1 (Div t u)  =do  n0 <- evalM1 t
                       n1 <- evalM1 u
                       return (n0 `div` n1)
-------------------------------------------------------------------------------------
--------------------------- MANEJANDO EL ERROR --------------------------------------

eval2            :: Exp -> Maybe Int
eval2 (Const n)  = Just n
eval2 (Plus t u) = case eval2 t of 
                        Nothing -> Nothing
                        Just n  -> case eval2 u of
                                        Nothing -> Nothing
                                        Just m  -> Just (n+m)

eval2 (Div t u)  = case eval2 t of 
                        Nothing -> Nothing
                        Just n  -> case eval2 u of
                                        Nothing -> Nothing
                                        Just m  -> if m==0 then Nothing
                                                           else Just (n `div` m)
{-
instance Monad Maybe where
        return x       = Just x
        Nothing  >>= f = Nothing
        (Just a) >>= f = f a -}  

throw :: Maybe a
throw = Nothing 

evalM2            :: Exp -> Maybe Int
evalM2 (Const n)  = return n
evalM2 (Plus t u) = do n <- evalM2 t
                       m <- evalM2 u
                       return (n+m)
evalM2 (Div t u)  = do n <- evalM2 t
                       m <- evalM2 u
                       if m==0 then throw 
                               else return (n `div` m)

-- CONTANDO DIVISIONES

eval3            :: Exp -> (Int,Int)
eval3 (Const n)  = (n,0)
eval3 (Plus t u) = (n0+n1,c0+c1) 
        where (n0,c0)=eval3 t
              (n1,c1)=eval3 u  
eval3 (Div t u)  = (n0 `div` n1,c0+c1+1)
        where (n0,c0)=eval3 t
              (n1,c1)=eval3 u 

newtype Acum a = Ac (a,Int)

instance Monad Acum where
        return x         = Ac (x,0)
        (Ac (a,n)) >>= f = let Ac (x',n') = f a in Ac (x',n+n')

runAcum         :: Acum a -> (a,Int)
runAcum (Ac p)  = p

tick :: Acum ()
tick = Ac ((),1)


evalM3            :: Exp -> Acum Int 
evalM3 (Const n)  = return n
evalM3 (Plus t u) = do m <- evalM3 t
                       n <- evalM3 u
                       return (m+n)

evalM3 (Div t u)  = do m <- evalM3 t
                       n <- evalM3 u
                       tick
                       return (m `div` n)

-- AGREGANDO VARIABLES
type Variable = String
data Expv = Constv Int | Var Variable | Plusv Expv Expv | Divv Expv Expv
type Env = Variable -> Int


eval4              :: Expv -> Env -> Int
eval4 (Constv n)  e = n
eval4 (Var v)     e = e v
eval4 (Plusv t u) e = n1+n2
        where (n1,n2) = (eval4 t e, eval4 u e)
eval4 (Divv t u)  e = n1 `div` n2
        where (n1,n2) = (eval4 t e, eval4 u e)



newtype Reader a = Reader (Env -> a)
runReader (Reader h) = h

instance Monad Reader where
        return x       = Reader (\_ -> x)
        Reader h >>= f = Reader (\p -> runReader (f (h p)) p )

ask :: Reader Env
ask = Reader (\p -> p)

evalM4              :: Expv -> Reader Int
evalM4 (Constv n)   = return n
evalM4 (Var v)      = do p <- ask
                         return (p v)
evalM4 (Plusv t u)  = do n <- evalM4 t 
                         m <- evalM4 u 
                         return (n+m)
evalM4 (Divv t u)   = do n <- evalM4 t 
                         m <- evalM4 u 
                         return (n `div` m)
                        



-- COMBINANDO


eval5              :: Expv -> Env -> Maybe (Int,Int)
eval5 (Constv n)  e = Just (n,0)
eval5 (Plusv t u) e = case eval5 t e of 
                        Nothing      -> Nothing
                        Just (n,c0)  -> case eval5 u e of
                                           Nothing      -> Nothing
                                           Just (m,c1)  -> Just (n+m,c0+c1)
eval5 (Divv t u) e = case eval5 t e of 
                        Nothing      -> Nothing
                        Just (n,c0)  -> case eval5 u e of
                                           Nothing      -> Nothing
                                           Just (m,c1)  -> if m==0 then Nothing
                                                                   else Just (n `div` m,c0+c1+1)

eval5 (Var x)   e  = Just (e x, 0)


newtype M a = M (Env -> Maybe (a,Int))
runM'       :: M a -> Env -> Maybe (a,Int)
runM' (M x) = x

throw' :: M a
throw' = M (\_ -> Nothing)

tick'  :: M ()
tick'  = M (\e -> Just ((),1))

ask'   :: M Env
ask'   = M (\e -> Just (e,0))



instance Monad M where
        return x   = M (\_ -> Just (x,0))       
        M h >>= f  = M (\p -> case h p of
                Nothing    -> Nothing
                Just (a,m) -> case runM' (f a) p of
                                        Nothing    -> Nothing
                                        Just (b,n) -> Just (b, n+m) )




evalM5             :: Expv -> M Int
evalM5 (Constv n)  = return n

evalM5 (Var x )    = do p <- ask' 
                        return (p x)

evalM5 (Plusv t u) = do m <- evalM5 t
                        n <- evalM5 u
                        return (m+n)

evalM5 (Divv t u)  = do m <- evalM5 t
                        n <- evalM5 u
                        tick'
                        if n==0 then throw' else return (m `div` n)



                                        
