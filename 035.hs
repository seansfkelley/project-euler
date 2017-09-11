import Data.Set (fromList)
import Data.Numbers.Primes (primes)
import Data.List (groupBy)

main = print $ map fromList . groupBy (\p -> floor(logBase 10 p)) . takeWhile (<1000000) $ primes
