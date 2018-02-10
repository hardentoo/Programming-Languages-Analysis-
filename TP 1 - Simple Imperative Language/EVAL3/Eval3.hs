module Eval3 (eval) where
-- Procedemos de la misma manera que en Eval2.hs, solo que llevando un contador (de tipo Cont = Int) de las operaciones aritmeticas asociado a cada expresion, valiendonos de la funcion desarmar, para manipular los constructores Left y Right. 
import AST

-- Estados
type State = ([(Variable,Int)])
type Error = String
type Cont = Int
-- Estado nulo
initState :: State
initState = []

-- Busca el valor de una variabl en un estado
-- Completar la definicion
lookfor :: Variable -> State -> Int
lookfor v s = [ b | (a,b) <- s, a==v] !! 0

-- Cambia el valor de una variable en un estado
-- Completar la definicion
update :: Variable -> Int -> State -> State
update v n s = [ (a,b) | (a,b) <- s , a/=v ] ++ [ (v,n) ]
 

isError :: Either a b -> Bool
isError (Right _) = True
isError (Left _ ) = False

f :: Either a b -> a
f (Left n) = n

-- Evalua un programa en el estado nulo
eval :: Comm -> Either (State,Cont) (Error,Int)
eval p = evalComm p initState

desarmar :: Either (a,Cont) (b,Cont) -> (Either a b,Cont)
desarmar (Left (x,y)) = (Left x,y)
desarmar (Right (x,y)) = (Right x,y)

-- Evalua un comando en un estado dado
-- Completar definicion
evalComm :: Comm -> State -> Either (State,Cont) (Error,Cont)
evalComm Skip s = Left (s,0)
evalComm (Let v n) s | isError value    = Right ("error",c)
                     | otherwise        = Left ((update v (f value) s),c)
                        where (value,c) = desarmar (evalIntExp n s)

evalComm (Seq c1 c2) s | isError value1 || isError value2 = Right ("error",cont1+cont2)
                       | otherwise                        = Left (f value2, cont1+cont2)
        where (value1,cont1) = desarmar (evalComm c1 s)
              (value2,cont2) = desarmar (evalComm c2 (f value1))

evalComm (Cond b ct cf) s | isError cond         = Right ("error",cont)
                          | cond == (Left True)  = if isError rest then ( Right ("error" ,contt+cont) ) else ( Left (f rest ,contt+cont) )
                          | cond == (Left False) = if isError resf then ( Right ("error" ,contf+cont) ) else ( Left (f resf ,contf+cont) )
        where (cond,cont) = desarmar (evalBoolExp b s)
              (rest,contt)= desarmar (evalComm ct s)
              (resf,contf)= desarmar (evalComm cf s)


evalComm w@(While b c) s | isError cond        = Right ("error",cont)
                         | cond == (Left True) = if (isError res) then (Right ("error",contt+cont)) else ( Left (f res , contt+cont) )
                         | cond == (Left False)= Left (s,cont)

        where (cond,cont) = desarmar (evalBoolExp b s)
              (res,contt) = desarmar ( evalComm (Seq c w) s )



-- Evalua una expresion entera, sin efectos laterales
-- Completar definicion
evalIntExp :: IntExp -> State -> Either (Int,Cont) (Error,Cont)
evalIntExp (Const x) s = Left (x,0)
evalIntExp (Var v) s = Left ((lookfor v s),0) 
evalIntExp (UMinus e) s | isError value     =  Right ("error",cont)
                        | otherwise         = Left (  (-1) * (f value) , 1+cont )
                         where (value,cont) = desarmar (evalIntExp e s)
                        
evalIntExp (Plus e1 e2) s | (isError value1) || (isError value2) = Right ("error",cont1+cont2) 
		          | otherwise                            = Left ( f value1 + f value2, 1+cont1+cont2)
			 where (value1,cont1) = desarmar (evalIntExp e1 s)
                               (value2,cont2) = desarmar (evalIntExp e2 s)

evalIntExp (Minus e1 e2) s   | (isError value1) || (isError value2) = Right ("error",cont1+cont2) 
		             | otherwise                            = Left ( f value1 - f value2, 1+cont1+cont2)
			 where (value1,cont1) = desarmar (evalIntExp e1 s)
                               (value2,cont2) = desarmar (evalIntExp e2 s)

evalIntExp (Times e1 e2) s  | (isError value1) || (isError value2) = Right ("error",cont1+cont2) 
		            | otherwise                            = Left ( f value1 * f value2, 1+cont1+cont2)
			 where (value1,cont1) = desarmar (evalIntExp e1 s)
                               (value2,cont2) = desarmar (evalIntExp e2 s)

evalIntExp (Div e1 e2) s   | (isError value1) || (isError value2) = Right ("error",cont1+cont2) 
                           | f value2 == 0                        = Right ("error",cont1+cont2)
			   | otherwise                            = Left ( div (f value1) (f value2) ,cont1+cont2+1)
			 where (value1,cont1) = desarmar (evalIntExp e1 s)
                               (value2,cont2) = desarmar (evalIntExp e2 s)

-- Evalua una expresion entera, sin efectos laterales
-- Completar definicion
evalBoolExp :: BoolExp -> State -> Either (Bool,Cont) (Error, Cont)

evalBoolExp BTrue s = Left (True,0)
evalBoolExp BFalse s = Left (False,0)
evalBoolExp (Eq e1 e2) s | isError exp1 || isError exp2 = Right ("error",cont1+cont2)
                         | otherwise                    = Left ( f exp1 == f exp2 , cont1+cont2)
        where (exp1,cont1) = desarmar (evalIntExp e1 s)
              (exp2,cont2) = desarmar (evalIntExp e2 s)


evalBoolExp (Lt e1 e2) s | isError exp1 || isError exp2 = Right ("error",cont1+cont2)
                         | otherwise                    = Left ( f exp1 < f exp2, cont1+cont2 )
        where (exp1,cont1) = desarmar (evalIntExp e1 s)
              (exp2,cont2) = desarmar (evalIntExp e2 s)

evalBoolExp (Gt e1 e2) s | isError exp1 || isError exp2 = Right ("error",cont1+cont2)
                         | otherwise                    = Left ( f exp1 > f exp2,cont1+cont2 )
        where (exp1,cont1) = desarmar (evalIntExp e1 s)
              (exp2,cont2) = desarmar (evalIntExp e2 s)


evalBoolExp (And b1 b2 ) s | isError exp1 || isError exp2 = Right ("error",cont1+cont2)
                           | otherwise                    = Left ( f exp1 && f exp2 ,cont1+cont2)
        where (exp1,cont1) = desarmar (evalBoolExp b1 s)
              (exp2,cont2) = desarmar (evalBoolExp b2 s)

evalBoolExp (Or b1 b2 ) s | isError exp1 || isError exp2 = Right ("error",cont1+cont2)
                          | otherwise                    = Left ( f exp1 || f exp2, cont1+cont2 )
        where (exp1,cont1) = desarmar (evalBoolExp b1 s)
              (exp2,cont2) = desarmar (evalBoolExp b2 s)

evalBoolExp (Not b) s | isError exp = Right ("error",cont)
                      | otherwise   = Left (not (f exp), cont)
        where (exp,cont) = desarmar (evalBoolExp b s)


