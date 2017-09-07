import Numeric
import Data.Char

palindrome b n = (showIntAtBase b intToDigit n "") == (reverse $ showIntAtBase b intToDigit n "")

main = print $ sum [n | n <- [1,2..1000000], palindrome 2 n && palindrome 10 n]

{-
isPalindrome str = if length str < 2
                   then True
                   else (head str == last str) && (isPalindrome $ init $ tail str)

isBoth n = (isPalindrome $ showInt n "") && (isPalindrome $ showIntAtBase 2 intToDigit n "")

main = print $ sum $ filter isBoth [1..999999]
-}