module Eval1 (eval) where

import AST

-- Estados
type State = [(Variable,Int)]

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
 

-- Evalua un programa en el estado nulo
eval :: Comm -> State
eval p = evalComm p initState

-- Evalua un comando en un estado dado
-- Completar definicion
evalComm :: Comm -> State -> State
evalComm Skip s = s
evalComm (Let v n) s = update v (evalIntExp n s) s
evalComm (Seq c1 c2) s = evalComm c2 (evalComm c1 s) 
evalComm (Cond b ct cf) s |  evalBoolExp b s = evalComm ct s 
                          |  otherwise = evalComm cf s 

evalComm w@(While b c) s | evalBoolExp b s = evalComm (Seq c w) s
                         | otherwise = s

-- Evalua una expresion entera, sin efectos laterales
-- Completar definicion
evalIntExp :: IntExp -> State -> Int
evalIntExp (Const x) s = x
evalIntExp (Var v) s = lookfor v s 
evalIntExp (UMinus e) s = (-1) * (evalIntExp e s)
evalIntExp (Plus e1 e2) s = (evalIntExp e1 s) + (evalIntExp e2 s)
evalIntExp (Minus e1 e2) s = (evalIntExp e1 s) - (evalIntExp e2 s)
evalIntExp (Times e1 e2) s = (evalIntExp e1 s) * (evalIntExp e2 s)
evalIntExp (Div e1 e2) s = div (evalIntExp e1 s) (evalIntExp e2 s)

-- Evalua una expresion entera, sin efectos laterales
-- Completar definicion
evalBoolExp :: BoolExp -> State -> Bool
evalBoolExp BTrue s = True
evalBoolExp BFalse s = False
evalBoolExp (Eq e1 e2) s = evalIntExp e1 s == evalIntExp e2 s
evalBoolExp (Lt e1 e2) s = evalIntExp e1 s < evalIntExp e2 s
evalBoolExp (Gt e1 e2) s = evalIntExp e1 s > evalIntExp e2 s
evalBoolExp (And b1 b2 ) s = evalBoolExp b1 s && evalBoolExp b2 s
evalBoolExp (Or b1 b2 ) s = evalBoolExp b1 s || evalBoolExp b2 s
evalBoolExp (Not b) s = not (evalBoolExp b s)
