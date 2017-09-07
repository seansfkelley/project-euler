import Data.Numbers.Primes
import Data.Function
import Data.Function.Memoize

lowestDivisor :: Int -> [Int] -> Int
lowestDivisor n (d:ds) = if n `mod` d == 0
                         then d
                         else lowestDivisor n ds

-- I don't understand where this algorithm came from but sampling some random, large
-- values it seems to work correctly, so whatever.
totient 1 = 1
totient n | isPrime n = n - 1
          | even n    = let m = n `div` 2
                        in if odd m
                          then totientMemo m
                          else 2 * totientMemo m
          | otherwise = let m = lowestDivisor n . tail $ primes
                            n' = n `div` m
                            d = gcd m n'
                        in ((totientMemo n') * (totientMemo m) * d) `div` totientMemo d

totientMemo = memoize totient

main = print $ [x | x <- takeWhile (<40000000) primes,
                        (length . filter (==1) . take 25 . iterate totientMemo $ x) == 1]
