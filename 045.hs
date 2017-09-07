import Numeric 

main = putStrLn $ showInt (head [pent | 
                                 pent <- [n * (3 * n - 1) `div` 2 | n <- [166..]],
                                 let radicand = 8 * pent + 1,
                                 let root = sqrt $ fromIntegral radicand :: Double,
                                 floor root == ceiling root,
                                 let root' = floor root,
                                 root' `mod` 4 == 3]) ""