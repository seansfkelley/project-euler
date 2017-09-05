import unittest
from primes import is_prime

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

if __name__ == '__main__':
    unittest.main()
