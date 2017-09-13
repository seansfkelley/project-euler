import Data.Numbers.Primes (primes)

integralLog b n | n < b = 0
                | otherwise = 1 + integralLog b (n `div` b)

hamming n lim =
  let
    hamming' n [] = 0
    hamming' n (p:ps) =
      let
        fs = scanl (*) 1 $ replicate (integralLog p n) p
      in
        (length fs) + (sum $ map (\f -> hamming' (n `div` f) ps) $ fs) - 1
  in
    1 + (hamming' n (takeWhile (<=lim) primes))

main = print $ hamming 1000000000 100
