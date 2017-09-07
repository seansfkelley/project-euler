{-
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
-}

import Numeric
import Data.List

explode n = reverse . explode' $ n
  where
    explode' 0 = []
    explode' n = n `mod` 10 : explode' (n `div` 10)

unexplode l = unexplode' l (length l - 1)
  where unexplode' [] _ = 0
        unexplode' (d:ds) len = d * (10 ^ len) + (unexplode' ds (len - 1))

pandigital n = let n' = explode n
               in (length . nub $ n') == 10 && length n' == 10

-- Evaluates to dn, where d is a single prepended digit to turn the 9-digit n into a pandigital,
-- if possible, and 0 otherwise.
prepend n = let n' = explode n
            in if (length . nub $ n') == 9 && length n' == 9 
               then unexplode $ head ([1..10] \\ n') : n'
               else 0

-- Get a small, cleverly constructed list of pandigital numbers that are worth checking 
-- by constructing them so digits 2-4 are divisible by 2, 5-7 by 7, and 8-10 by 17, using
-- prepend to figure out the first digit (if applicable -- throw it out using filter otherwise).
pans = filter (\x -> x /= 0) $ map prepend [unexplode $ foldr (++) [] $ map explode [a,b,c] | 
                                            a <- [102,104..999], b <- [105,112..999], c <- [102,119..999]]

-- True if the number obeys the substring divisibility rules defined in the problem, false
-- otherwise.
divisible n = let n' = explode n 
                  check_div [] [] = True
                  check_div (n:ns) (d:ds) = n `mod` d == 0 && check_div ns ds
              in
               check_div [unexplode . (take 3) $ drop i n' | i <- [1..7]]
                         [2,3,5,7,11,13,17]

div_pans = filter divisible pans

main = putStrLn $ showInt (sum div_pans) ""