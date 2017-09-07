import Data.Numbers.Primes as Primes

cutoff = 10 ^ 8

count i (p:ps) = if p ^ 2 > cutoff
                 then (ps, i * (i - 1) `div` 2)
                 else let (ps', s) = count (i + 1) ps
                          diff = length $ takeWhile (\x -> x * p < cutoff) (drop (j - i - 1) ps)
                      in (j + diff, s + diff * i)

main = print $ snd $ count 1 Primes.primes