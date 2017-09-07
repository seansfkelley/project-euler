import Data.Numbers.Primes

totient 1 = 1
totient n | isPrime n = n - 1 
          | even n    = let m = n `div` 2
                        in if odd m 
                           then totient m
                           else 2 * totient m
          | otherwise = let m = lowestDivisor n . tail $ primes
                            n' = n `div` m
                            d = gcd m n'
                        in ((totient n') * (totient m) * d) `div` totient d
  where
    lowestDivisor n (d:ds) = if n `mod` d == 0 
                             then d
                             else lowestDivisor n ds

main = print $ sum [x | x <- takeWhile (<40000000) primes, 
                        (length . filter (==1) . take 25 . iterate totient $ x) == 1]