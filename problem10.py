# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

def sieve(n):
    flags = [True] * n
    
    yield 2
    for i in xrange(3, n, 2):
        if flags[i]:
            for j in xrange(i, n, i):
                flags[j] = False
            yield i

print sum(sieve(2000000))