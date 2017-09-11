module Utils where

import Data.List
import Data.Numbers.Primes

-- Oops, this already exists in Primes, but whatever, it's good practice.
-- primeFactors n = factors' n primes
--   where
--     factors' n (p:ps)
--       | n == 1 = []
--       | n `mod` p == 0 = p:(factors' (n `div` p) (p:ps))
--       | otherwise = factors' n ps

cartesian [] = [[]]
cartesian (x:xs) = [(head:rest) | rest <- cartesian xs, head <- x]

powerset [] = [[]]
powerset (x:xs) = [s | rest <- powerset xs, s <- [rest, x:rest] ]

factors :: Integral int => int -> [int]
factors =
  map (foldr (*) 1) .
  cartesian .
  map (scanl (*) 1) .
  group .
  primeFactors

properDivisors :: Integral int => int -> [int]
properDivisors n = filter (/=n) . factors $ n

perfect n = n == (sum . properDivisors $ n)

factorial 0 = 1
factorial n = n * (factorial $ n - 1)

countDigits :: Integral a => a -> Int
countDigits 0 = 0 -- This is a weird base case but it's not really clear how best to define this for zero.
countDigits n = 1 + countDigits (n `div` 10)

splice n xs =
  let
    (ys, zs) = splitAt n xs
  in
    ys ++ (tail zs)
