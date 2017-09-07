import Numeric
import qualified Data.IntMap as IntMap

minus (x:xs) (y:ys) = case (compare x y) of 
                      LT -> x : minus  xs  (y:ys)
                      EQ ->     minus  xs     ys 
                      GT ->     minus (x:xs)  ys
minus  xs     _     = xs

sieve n = 2:sieve' [3,5..n]
  where
    sieve' [] = []
    sieve' (p:ns) = p : (sieve' $ ns `minus` [p*p,p*p+2*p..n])

primes = sieve 1000000

prime_map = IntMap.fromDistinctAscList $ zip primes (repeat 1)

isPrime p = IntMap.member p prime_map

problem50 [] = 0
problem50 (sz:szs) = window 0 sz
  where
    window _ 0 = 0
    window start size = let sum_p = sum $ take size $ drop start primes
                        in if sum_p > 1000000
                           then window 0 (size - 1)
                           else if isPrime sum_p
                                then sum_p
                                else window (start + 1) size

main = putStrLn $ showInt (problem50 [546,545..1]) ""
