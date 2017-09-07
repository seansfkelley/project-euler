import Numeric
import Data.List

explode 0 = []
explode n = n `mod` 10 : explode (n `div` 10)

bouncy n = let n' = explode n
           in not (n' == sort n' || n' == (reverse . sort) n')
   
main = putStrLn $ showInt (
    let
      go bouncies total cur = if bouncies / total >= 0.99 
                              then cur - 1
                              else go (bouncies + if bouncy cur then 1 else 0) (total + 1) (cur + 1)
    in
     go 0 100 101
     ) ""