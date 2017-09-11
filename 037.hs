import Data.List
import Data.Numbers.Primes

truncatable 2 = False
truncatable 3 = False
truncatable 5 = False
truncatable 7 = False
truncatable n = (trunc . init . tails $ shown) && (trunc . tail . inits $ shown)
  where
    shown = show n
    trunc = all isPrime . map read

main = print $ sum $ take 11 $ filter truncatable primes
