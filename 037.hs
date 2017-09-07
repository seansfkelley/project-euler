import Data.List
import qualified Data.Numbers.Primes as Primes

truncatable 2 = False
truncatable 3 = False
truncatable 5 = False
truncatable 7 = False
truncatable n = (trunc . init . tails . show $ n) && (trunc . tail . inits . show $ n)
  where
    trunc = all Primes.isPrime . map read 

main = print $ sum $ take 11 $ filter truncatable Primes.primes