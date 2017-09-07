# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.
def is_palindrome(n):
    return str(n)[::-1] == str(n)


# Bad solution -- should be able to generate numbers in order, or at least know when we can't possibly generate
# numbers higher than the largest with our remaining pool of factors.
largest = 0
for i in xrange(1000):
    for j in xrange(1000):
        if is_palindrome(i * j) and i * j > largest:
            largest = i * j

print largest
