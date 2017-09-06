import sys
from primes import Sieve
from math import sqrt

sieve = Sieve()
candidate = 2

def check_is_goldbachy(n):
  for p in sieve.primes(prime):
    root = sqrt((candidate - p) / 2)
    if root == int(root):
      return

  print '%d is not goldbachy!' % candidate
  sys.exit(0)

for prime in sieve.primes():
  while candidate < prime:
    if candidate % 2 == 0:
      candidate += 1
      continue

    if candidate % 1000 == 1:
      print candidate

    check_is_goldbachy(candidate)
    candidate += 1

  # skip over prime
  candidate += 2
