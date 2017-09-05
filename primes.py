from math import sqrt

def is_prime(n):
  if int(n) != n:
    raise ValueError()
  elif n <= 0:
    raise ValueError()
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
