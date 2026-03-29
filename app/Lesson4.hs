module Lesson4 where

    
data LogLevel = Error | Warning | Info
    deriving Show

newtype LogLevelInt = LogLevel Int

cmp :: LogLevel -> LogLevel -> Ordering
cmp x y
    | go x > go y = GT
    | go x < go y = LT
    | otherwise = EQ 
    where 
    go :: LogLevel -> Int
    go q = case q of
        Error -> 3
        Warning -> 2
        Info -> 1


