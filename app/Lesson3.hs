module Lesson3 where
import Lesson2
import Data.List    


infixl 4 :@
data Term = Var Symb
          | Term :@ Term
          | Lam Symb Type Term
    deriving (Eq,Show)

freeVars :: Term -> [Symb]
freeVars t = nub $ case t of
  Var x -> [x]
  l :@ r -> freeVars l ++ freeVars r
  Lam x _ body -> filter (/= x) (freeVars body)

boundVars :: Term -> [Symb]
boundVars x = case x of
    Var _ -> []
    l :@ r -> boundVars l ++ boundVars r 
    Lam q _ body -> q : boundVars body
