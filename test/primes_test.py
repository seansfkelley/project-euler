import unittest
import itertools
from primes import is_prime
from primes import Sieve

class TestPrimes(unittest.TestCase):

  def test_is_prime_illegal(self):
    self.assertRaises(ValueError, is_prime, -1)
    self.assertRaises(ValueError, is_prime, 0)
    self.assertRaises(ValueError, is_prime, 1.1)

  def test_is_prime_true(self):
    self.assertTrue(is_prime(2))
    self.assertTrue(is_prime(3))
    self.assertTrue(is_prime(104743)) # 10001st prime!

  def test_is_prime_false(self):
    self.assertFalse(is_prime(1))
    self.assertFalse(is_prime(100000))

  def test_sieve_nth(self):
    sieve = Sieve()

    self.assertEqual(sieve.nth(0), 2)
    self.assertEqual(sieve.nth(1), 3)
    self.assertEqual(sieve.nth(10), 31)

  def test_sieve_primes_illegal(self):
    sieve = Sieve()

    self.assertRaises(ValueError, sieve.primes, 1.1)
    self.assertRaises(ValueError, sieve.primes, 1, 1.1)

  def test_sieve_primes(self):
    sieve = Sieve()

    self.assertEqual([2, 3, 5], list(itertools.islice(sieve.primes(), 0, 3)))
    self.assertEqual([2, 3, 5, 7, 11], list(sieve.primes(12)))
    self.assertEqual([], list(sieve.primes(4, 3)))
    self.assertEqual([5, 7, 11], list(sieve.primes(4, 12)))

if __name__ == '__main__':
  unittest.main()
