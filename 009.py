# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# 
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
import sys

for a in xrange(1, 1001):
    for b in xrange(a + 1, 1001):
        if a ** 2 + b ** 2 == (1000 - a - b) ** 2:
            print a * b * (1000 - a - b)
            sys.exit(0)
