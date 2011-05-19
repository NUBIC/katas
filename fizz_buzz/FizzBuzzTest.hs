module FizzBuzzTest where

import FizzBuzz
import Test.QuickCheck

gen3     = suchThat arbitrarySizedIntegral (\x -> (x `mod` 3 == 0) && not (x `mod` 5 == 0))
gen5     = suchThat arbitrarySizedIntegral (\x -> (x `mod` 5 == 0) && not (x `mod` 3 == 0))
gen3And5 = suchThat arbitrarySizedIntegral (\x -> (x `mod` 3 == 0) && (x `mod` 5 == 0))
genOther = suchThat arbitrarySizedIntegral (\x -> not ((x `mod` 3 == 0) || (x `mod` 5 == 0)))

fizzOnMultiplesOf3 = quickCheck $ forAll gen3 $ (\x -> fizzbuzz x == "Fizz")
buzzOnMultiplesOf5 = quickCheck $ forAll gen5 $ (\x -> fizzbuzz x == "Buzz")
fizzbuzzOnMultiplesOf3And5 = quickCheck $ forAll gen3And5 $ (\x -> fizzbuzz x == "FizzBuzz")
showNumOnOther = quickCheck $ forAll genOther $ (\x -> fizzbuzz x == show x)
