module Main where

import Lesson1
import Lesson2
import Lesson3
import Lesson4


main::IO()    
main = do
    let 
        x = Var "x"
        a = TVar "a"
        b = TVar "b"
        c = TVar "c"

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
    let 
       

    print $ boundVars (Lam "x" a (x :@ x))
    print $ boundVars (Lam "x" a (x :@ Lam "x" a x))
    print $ boundVars (x :@ Lam "x" a (x :@ Lam "x" a x)) 

    print "--- Lesson 4 --"
    print $ cmp Info Warning