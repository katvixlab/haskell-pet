{-# LANGUAGE InstanceSigs #-}
module Lesson6 where
data Tree a = Leaf 
            | Node (Tree a) a (Tree a)
  deriving Show


instance Functor Tree where
    fmap :: (a -> b) -> Tree a -> Tree b
    fmap _ Leaf = Leaf
    fmap f (Node left x right) = Node (fmap f left) (f x) (fmap f right)

elemTree :: Eq a => a -> Tree a -> Bool
elemTree _ Leaf = False
elemTree f (Node left x right) = f == x ||  elemTree f right || elemTree f left