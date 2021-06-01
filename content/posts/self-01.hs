module Main where

main :: IO
n <- readLn
print(grosser n 0)

grosser :: Int -> Int -> Bool
grosser x y = x > y 