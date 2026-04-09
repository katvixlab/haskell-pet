module Lesson5 where

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int }
  deriving Show

abbrFirstName :: Person -> Person
abbrFirstName p
    | length (firstName p) > 2 = Person {firstName = take 1 (firstName p :: String) ++ ".", lastName = lastName p, age = age p}
    | otherwise = p