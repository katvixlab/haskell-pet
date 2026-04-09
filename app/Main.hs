module Main where

import Lesson1
import Lesson2
import Lesson3
import Lesson4
import Lesson5 
import Lesson6


main::IO()    
main = do
    let 
        x = Var "x"
        a = TVar "a"
        b = TVar "b"
        c = TVar "c"
        person1 = Person {firstName = "Adam", lastName = "Smith", age = 66}
        person2 = Person {firstName = "Ad", lastName = "Smith", age = 66}
        t1 = Node (Node (Node Leaf 5 Leaf) 2 Leaf) 3 (Node Leaf 4 Leaf)
        t2 = Node (Node Leaf 2 Leaf) 3 (Node Leaf 4 Leaf)
        t3 = Node Leaf 42 Leaf
        tInf1 n = Node (tInf1 (n+2)) n (Node Leaf 42 Leaf)
        tInf2 n = Node (tInf2 (n+2)) n (tInf2 (3*n-1))

    print "--- Lesson 1 --"
    print $ movingLists 3 [1..9]

    print "--- Lesson 2 --"
    print $ arity a                     -- 0
    print $ arity (a :-> b)             -- 1
    print $ arity ((a :-> b) :-> c)     -- 1
    print $ arity (a :-> b :-> c)       -- 2
    print $ arity ((b :-> c) :-> (a :-> b) :-> a :-> c)  -- 3
    print $ order ((b :-> c) :-> (a :-> b) :-> a :-> c)  -- 2
    print $ order (a:->(b:->c:->a:->b):->c) -- 2

    print "--- Lesson 3 --"

    print $ boundVars (Lam "x" a (x :@ x))
    print $ boundVars (Lam "x" a (x :@ Lam "x" a x))
    print $ boundVars (x :@ Lam "x" a (x :@ Lam "x" a x)) 

    print "--- Lesson 4 --"
    print $ cmp Info Warning

    print "--- Lesson 5 --"
    print $ abbrFirstName person1
    print $ abbrFirstName person2

    print "--- Lesson 6 --"
    print $ elemTree 2 t1
    print $ elemTree 42 (tInf1 3)