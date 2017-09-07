import Numeric
import Data.Char

fac 1 = 1
fac n = n * fac (n - 1)

main = print $ sum $ map digitToInt $ showInt (fac 100) ""
