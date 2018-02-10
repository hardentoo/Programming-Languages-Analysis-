module AST where


data HList = Nil | Cons (Either Char Int) (HList) deriving Show


type HList2 = [Either Char Int]
