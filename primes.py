from math import sqrt

def is_prime(n):
  if int(n) != n:
    raise ValueError('cannot check primality of non-integer value %d' % n)
  elif n <= 0:
    raise ValueError('cannot check primality of non-positive value %d' % n)
  elif n == 1:
    return False
  elif n == 2:
    return True
  elif n % 2 == 0:
    return False
  else:
    # Not the most efficient, but okay for now.
    for i in xrange(3, int(sqrt(n))):
      if n % i == 0:
        return False
    return True

class Sieve:
  def __init__(self):
    self.sieve = [2]

  def _is_prime(self, n):
    return all(n % p != 0 for p in self.sieve[:self.indexof(sqrt(n))])

  def _add_primes_until_value(self, n):
    candidate = self.sieve[-1] + 1
    while n > self.sieve[-1]:
      while not self._is_prime(candidate):
        candidate += 1
      self.sieve.append(candidate)
      candidate += 1

  def _add_primes_until_index(self, i):
    candidate = self.sieve[-1] + 1
    while len(self.sieve) <= i:
      while not self._is_prime(candidate):
        candidate += 1
      self.sieve.append(candidate)
      candidate += 1

  def indexof(self, n):
    self._add_primes_until_value(n)
    # TODO: Binary search.
    for i, p in enumerate(self.sieve):
      if p >= n:
        return i + 1

    assert False, 'should always find something greater than or equal to the number given'

  def nth(self, i):
    self._add_primes_until_index(i - 1)
    return self.sieve[i - 1]

  def _range_args(self, *args):
    if len(args) == 0:
      start, stop = 2, None
    elif len(args) == 1:
      start, stop = 2, args[0]
    elif len(args) == 2:
      start, stop = args
    else:
      raise ValueError('primes accepts 0-2 arguments, got %d' % len(args))

    if int(start) != start:
      raise ValueError('start value must be an integer')
    elif stop is not None and int(stop) != stop:
      raise ValueError('stop value must be an integer')

    return start, stop

  def primes(self, *args):
    start, stop = self._range_args(*args)
    return PrimeIterator(start, stop, self)

  def composites(self, *args):
    start, stop = self._range_args(*args)
    return CompositeIterator(start, stop, self)

class PrimeIterator:
  def __init__(self, start, stop, sieve):
    self.start = start
    self.stop = stop
    self.sieve = sieve

  def __iter__(self):
    i = self.sieve.indexof(self.start if self.start > 2 else 2)
    p = self.sieve.nth(i)
    end = self.stop if self.stop is not None else float('inf')

    while p < end:
      yield p
      i += 1
      p = self.sieve.nth(i)

    raise StopIteration()

class CompositeIterator:
  def __init__(self, start, stop, sieve):
    self.primes = sieve.primes(start, stop)

  def __iter__(self):
    n = None
    for prime in self.primes:
      if n == None:
        n = prime + 1
      else:
        while n < prime:
          yield n
          n += 1
        n += 1 # skip prime

    raise StopIteration()
