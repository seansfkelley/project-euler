import Numeric
import Data.Char

count x [] = 0
count x (y:ys) | x == y =    1 + count x ys
               | otherwise = count x ys

f n d = tail $ scanl (\acc new -> acc + count (intToDigit d) (showInt new "")) 0 [0..n]

-- logBase may introduce error that causes rounding to produce incorrect results.
digits n = length $ showInt n ""

f_const 0 _ = 0
f_const n d = let exp = (digits n) - 1
                  lead = n `div` (10 ^ exp)
              in case (compare d lead) of
                LT -> 