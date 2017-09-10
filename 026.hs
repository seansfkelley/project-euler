{-

Experimentally, it seems like fractions have a repeating decimal expansion iff their denominator's
prime factorization contains _any_ primes that are not present in the base's prime factorization
(being 2 and 5 in the case of base 10). This makes some vague amount of intuitive sense but I can't
exactly articulate why.

Some experiments on periodicity with Wolfram as an oracle:

998 = 2 * 499        -> period 498
997 = 997            -> period 166
996 = 2 * 2 * 3 * 83 -> period 41
995 = 5 * 199        -> period 99
917 = 7 * 131        -> period 390
786 = 2 * 3 * 131    -> period 130
499 = 499            -> period 498
498 = 2 * 3 * 83     -> period 41
465 = 3 * 5 * 31     -> period 15
241 = 241            -> period 30

It appears there's _some_ correlation between "largest prime factor minus 1" and the period,
but no single pattern immediately jumps to mind.

997 -> 997 -> (p - 1) / 6 -> 166
996 -> 83  -> (p - 1) / 2 -> 41
917 -> 131 -> (p - 1) * 3 -> 390
786 -> 131 -> p - 1       -> 130
499 -> 499 -> p - 1       -> 498
241 -> 241 -> (p - 1) / 8 -> 30

-}

import Data.Numbers.Primes
import Data.List

isRepeating b n = (length $ (nub . primeFactors $ n) \\ (nub . primeFactors $ b)) >= 1

main = print $ filter (isRepeating 10) [1..1000]
