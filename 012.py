# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
#
# What is the value of the first triangle number to have over five hundred divisors?

from primes import Sieve
import itertools
import operator
import sys

s = Sieve()

def triangles():
    i = 1
    acc = 0
    while True:
        acc += i
        yield acc
        i += 1

for i, t in enumerate(triangles()):
    # https://mathschallenge.net/library/number/number_of_divisors
    factor_count = reduce(operator.mul, (len(list(iterable)) + 1 for key, iterable  in itertools.groupby(s.prime_factors(t))), 1)
    if i % 1000 == 0:
        print i, ':', t
    if factor_count > 500:
        print t
        sys.exit(0)
