import Utils

d = sum . properDivisors

amicable n = n == (d (d n))

-- skip 1 because sum [] = 0 and properDivisors should probably throw when asked for zero but it returns []
main = print . sum . filter (not . perfect) . filter amicable $ [2..10000]
