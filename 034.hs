import Numeric

fac 0 = 1
fac n = n * fac (n - 1)

fac_list = map fac [0..9]

get_fac i = fac_list !! i

explode 0 = []
explode n = n `mod` 10 : explode (n `div` 10)

main = putStrLn $ showInt (
  sum [x | x <- [3..9999999], x == sum (map get_fac (explode x))]
  ) ""