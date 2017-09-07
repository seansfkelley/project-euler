import Data.Numbers.Primes
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

chain :: Int -> [Int]
chain 1 = [1]
chain n = n:(chain $ totientMemo n)

candidates = takeWhile (<40000000) primes

-- Sanity check: do we generate the right 4-length chains?
-- main = print $ map chain [5, 7, 8, 9, 10, 12, 14, 18]

-- Timing baseline: how long does it take the get these primes?
-- main = print $ length $ candidates

-- Do the actual thing.
main = print $ sum $ filter (\p -> (length . chain $ p) == 25) $ candidates
