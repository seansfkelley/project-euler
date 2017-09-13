import Data.Numbers.Primes (primes)

integralLog :: Int -> Int -> Int
integralLog b n | n < b = 0
                | otherwise = 1 + integralLog b (n `div` b)

hamming n lim =
  let
    hamming' n [] = 0
    hamming' n (p:ps) =
      let
        fs = scanl (*) 1 $ replicate (integralLog p n) p
        recurse = (\f -> hamming' (n `div` f) ps)
      in
        (length fs) + (sum $ map recurse $ fs) - 1
  in
    1 + (hamming' n (takeWhile (<=lim) primes))

main = print $ hamming 100000000 5
