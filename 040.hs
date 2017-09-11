import Utils (nthDigit)

integersOfLength n = 9 * 10 ^ (n - 1)

nth n = nth' n 1
  where
    -- To be explicit, l * (integersOfLength l) is the number of characters integers of precisely `l` characters are.
    nth' n l | n <= l * (integersOfLength l) =
                let
                  i = n `div` l
                  offset = n `mod` l
                in
                  nthDigit offset (10 ^ (l - 1) + i)
             | otherwise = nth' (n - l * (integersOfLength l)) (l + 1)

-- Note that we 0-index but the problem is 1-indexed, hence the indices computed below.
-- Note also we can't use the (-1) syntax because it's ambiguous. :(
-- https://stackoverflow.com/questions/4454559/currying-subtraction
main = print $ product $ map (nth . (subtract 1) . (10^)) $ [0..6]
