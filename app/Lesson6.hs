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
go :: Eq a => a -> [Tree a] -> Bool
elemTree a tree = go a [tree]
go _ [] = False
go f (Node left y right:ys) = f == y || go f (ys ++ [right, left])
go f (Leaf:ys) = go f ys
