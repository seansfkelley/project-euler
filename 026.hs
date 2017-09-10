{-

Experimentally, it seems like fractions have a repeating decimal expansion iff their denominator's
prime factorization contains _any_ primes that are not present in the base's prime factorization
(being 2 and 5 in the case of base 10). This makes some vague amount of intuitive sense but I can't
exactly articulate why.

Some experiments on periodicity with Wolfram as an oracle:

998 = 2 * 499 -> period 498
997 = 997 -> period 166 (???)
996 = 2 * 2 * 3 * 83 -> period 41
995 = 5 * 199 -> period 99
499 = 499 -> period 498

So there's some correlation between "largest prime factor" and the period, specifically. Sometimes
it's p / 2 - 1 (e.g. 996), sometimes it's just p - 1 (e.g. 499), and sometimes I'm not sure (e.g. 997).

-}

import Data.Numbers.Primes
import Data.List

isRepeating b n = (length $ (nub . primeFactors $ n) \\ (nub . primeFactors $ b)) >= 1

main = print $ filter (isRepeating 10) [1..1000]
