import Data.List

{-
For each of the 10! permutations, divvy them up into three parts and check if that's a valid product.

Limitations: the third part (product) has to have at least as many digits as each of the first two
parts (factors). This is because we don't have zero, so any given n-digit numbers are at least
10^(n-1), and 10^(n-1) * 10^(m-1) = 10^(n+m-2) which is at least n+m-1 > n-1 digits.

In the case of 9 digits, this means that the factors should have at most 5 digits between them.
-}

digits = [1,2,3,4,5,6,7,8,9]
factorDigitLengths = [(x, y) | x <- [1..4], y <- [1..5-x]]

numerify = foldl ((+) . (* 10)) 0

makeCandidates ds = map (\(x, y) -> map numerify [take x $ ds, take y . drop x $ ds, drop x . drop y $ ds]) $ factorDigitLengths

validProduct (f1:f2:p:[]) = f1 * f2 == p

main = print $ sum . nub . map last . (filter validProduct) . (concatMap makeCandidates) . permutations $ digits
