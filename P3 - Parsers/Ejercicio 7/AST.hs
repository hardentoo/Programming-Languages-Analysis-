module AST where

data Hasktype = DInt | DChar | Fun Hasktype Hasktype deriving Show
-- tal que asocie a derecha como haskell
