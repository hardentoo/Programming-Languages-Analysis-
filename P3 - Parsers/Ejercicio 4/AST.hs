module AST where



data Expr = Num Int | BinOp Op Expr Expr deriving Show
data Op   = Add | Mul | Min | Div deriving Show
