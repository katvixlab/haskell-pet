module Lesson1 where
movingLists :: Int -> [Int] -> [[Int]]
movingLists = go 
    where
        go y xz
            | y <= 0 = []
            | null (drop (y-1) xz) = []
        go y (x:xs) = take y (x:xs) : go y xs
        go _ [] = []