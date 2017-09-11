import Data.Set (fromList)
import Data.Numbers.Primes (primes)
import Data.List (groupBy)
import Utils (countDigits)

rotate n = (n `mod` e) * 10 + d
  where
    c = countDigits n
    e = 10 ^ (c - 1)
    d = n `div` e

filterCycles ps = filter (\p -> ???) ps
  where
    s = fromList ps

main = print $ length $ concatMap filterCycles $ groupBy (\p0 p1 -> countDigits p0 == countDigits p1) $ takeWhile (<1000000) $ primes
