newtype State s a = St {runState :: s -> (a,s) }
instance Monad (State s) where
    return x     = St (\e -> (x,e))
    (St h) >>= f = St (\s -> let (x,s') = h s 
                 in   runState (f x) s' )
                          
{- 

(monad.1)

    return x >>= f
=<def de return>
    St (\e->(x,e)) >>= f
=<def de >>=>
    St (\s -> let (x',s') = (\e->(x,e)) s 
              in  runState (f x') s')
=< aplico >
    St (\s ->  runState (f x) s )
=<*>
    St (\s ->  runState (St p) s )
=<def de runState>
    St (\s -> p s)
=<extensionalidad>
    St p
= < * >
    f x
    
    
*) f x :: State s b => f x = St p ; p :: s -> (b,s)


(monad.2)

    (St h) >>= return 
= < def de >>= >
     St (\s -> let (x,s') = h s 
               in   runState (return x) s' )
= < def de return >
     St (\s -> let (x,s') = h s 
               in   runState (St (\e -> (x,e))) s' )
= <def de runstate>
     St (\s -> let (x,s') = h s 
               in  (x,s') ) 
= <extensionalidad>
    St  (\s -> h s)
= < extensionalidad>
    St h
    

(monad.3)



    (St h >>= f) >>= g
=< >>= >
    (St (\s -> let (x,s') = h s in   runState (f x) s' ) ) >>= g
= <*>
    (St (\s -> let (x,s') = (a0,s0) in   runState (f x) s' ) ) >>= g
=<aplico let>
    (St (\s -> runState (f a0) s0 ) ) >>= g
= <*>
    (St (\s -> runState (St kf) s0 ) ) >>= g
= < def de runState >
    (St (\s -> kf s0) ) >>= g
= < >>= >
    St (\e -> let (z0,z1) = (\s -> kf s0) e in runState (g z0) z1)
= < aplico >
    St (\e -> let (z0,z1) = kf s0 in runState (g z0) z1)
= <*>
    St (\e -> let (z0,z1) = (a1,s1) in runState (g z0) z1)
= < evaluo let>
    St (\e -> runState (g a1) s1) 
= < evaluacion de let >     
    St (\s ->    let (p0,p1) = (a1,s1) in runState (g p0) p1    )       
= < * >     
    St (\s ->    let (p0,p1) = kf s0 in runState (g p0) p1    ) 
= < runstate def >
    St (\s -> runState ( St (\e -> let (p0,p1) = kf e in runState (g p0) p1 )  ) s0)
=< >>= >
    St (\s -> runState ((St kf) >>=g) s0)
= <*>
    St (\s -> runState (f a0 >>=g) s0)
=<aplico let>
    St (\s -> let (x,s') = (a0,s0) in runState (f x >>=g) s')
=<*>
    St (\s -> let (x,s') = h s in runState (f x >>=g) s')
= < app> 
    St (\s -> let (x,s') = h s in runState ( (\x-> f x >>=g) x) s'
=< >>= >
    St h >>= (\x -> f x >>=g)


*) h s = (a0,s0)
*) f a0 = (St kf) 
*) kf s0 = (a1,s1)                                                   -}


set   :: s -> State s ()
set s = St (\e -> ( () , s) )

get   :: State s s
get   = St (\e -> (e,e))

