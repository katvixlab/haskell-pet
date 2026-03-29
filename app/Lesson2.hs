module Lesson2 where
import Data.List

type Symb = String 

infixr 3 :->
data Type = TVar Symb 
          | Type :-> Type
    deriving (Eq,Show)


arity :: Type -> Int
arity x = go x 0
    where
        go (_ :-> xs) y = go xs (y+1)
        go _ y = y

order :: Type -> Int
order x = case x of
  TVar _   -> 0
  s :-> t  -> max (order s + 1) (order t) 