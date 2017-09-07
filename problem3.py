# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

start = 600851475143
p = 3
while True:
    while start % p == 0:
        start /= p
    if start == 1:
        print p
        break
    p += 2
