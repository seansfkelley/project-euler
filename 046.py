import sys
from primes import Sieve
from math import sqrt

sieve = Sieve()

def check_is_goldbachy(n):
  for p in sieve.primes(n):
    root = sqrt((n - p) / 2)
    if root == int(root):
      return

  print '%d is not goldbachy!' % n
  sys.exit(0)

for n in sieve.composites():
  if n % 2 == 1:
    if n % 1000 == 1:
      print n

    check_is_goldbachy(n)
