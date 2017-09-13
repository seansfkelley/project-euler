import Data.Numbers.Primes (primes)

integralLog :: Int -> Rational -> Int
integralLog b n | n < (toRational b) = 0
                | otherwise = 1 + integralLog b (n / (toRational b))

hamming n lim =
  let
    hamming' n [] = 0
    hamming' n (p:ps) =
      let
        fs = scanl (*) 1 $ replicate (integralLog p (toRational n)) p
        recurse = (\f -> hamming' (n / (toRational f)) ps)
      in
        (length fs) + (sum $ map recurse $ fs) - 1
  in
    1 + (hamming' n (takeWhile (<=lim) primes))

main = print $ hamming 100000000 5
