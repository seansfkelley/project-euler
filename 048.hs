import Numeric

main = putStrLn $ showInt (mod (sum $ map (\x -> x ^ x) [1..999]) (10 ^ 10)) ""
