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

    self.assertEqual(sieve.nth(1), 2)
    self.assertEqual(sieve.nth(2), 3)
    self.assertEqual(sieve.nth(11), 31)
    self.assertEqual(sieve.nth(10001), 104743)

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

  def test_sieve_composites(self):
    sieve = Sieve()

    self.assertEqual([4, 6, 8], list(itertools.islice(sieve.composites(), 0, 3)))
    self.assertEqual([], list(sieve.composites(3)))
    self.assertEqual([4], list(sieve.composites(5)))
    self.assertEqual([4, 6, 8, 9, 10], list(sieve.composites(12)))
    self.assertEqual([], list(sieve.composites(4, 3)))
    self.assertEqual([6, 8, 9, 10, 12], list(sieve.composites(5, 13)))

if __name__ == '__main__':
  unittest.main()
