import Data.List
import Data.Function

collatz n | even n = n `div` 2
          | otherwise = 3 * n  + 1

collatzLength n = length $ takeWhile (/=1) $ iterate collatz n

main = print $ maximumBy (compare `on` snd) $ map (\x -> (x, collatzLength x)) [1..1000000]
