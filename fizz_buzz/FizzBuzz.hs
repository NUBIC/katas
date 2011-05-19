module FizzBuzz where

import Data.List (unlines)

fizz num | num `mod` 3 == 0 = "Fizz"
         | otherwise        = ""

buzz num | num `mod` 5 == 0 = "Buzz"
         | otherwise        = ""

fizzbuzz num = let fb = (fizz num ++ buzz num) in
                case fb of
                  "" -> show num
                  _  -> fb

main = putStrLn $ unlines (map fizzbuzz [1..100])
