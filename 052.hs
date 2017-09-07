import Data.List

explode 0 = []
explode n = n `mod` 10 : explode (n `div` 10)

m = go 1
    where
      go i = let
        l = map (sort . explode) [x*i | x <- [1..6]]
        in
         if all (==True) (zipWith (==) (tail l) l) then i else go (i + 1)
         