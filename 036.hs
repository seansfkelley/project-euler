import Numeric
import Data.Char

palindrome b n =
  let
    shown = showIntAtBase b intToDigit n ""
  in
    shown == reverse shown

main = print $ sum $ filter (\n -> palindrome 2 n && palindrome 10 n) $ [1..1000000]
