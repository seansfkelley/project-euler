cancels :: Int -> Int -> Bool
cancels n d =
    (nl == dl && q == nr / dr) ||
    (nl == dr && q == nr / dl) ||
    (nr == dr && q == nl / dl) ||
    (nr == dl && q == nl / dr)
    where
      q = (toRational n) / (toRational d)
      nl = toRational $ n `div` 10
      nr = toRational $ n `mod` 10
      dl = toRational $ d `div` 10
      dr = toRational $ d `mod` 10

non10s = filter (\x -> x `mod` 10 /= 0) [11..99]

main = print $ product . map (uncurry (/)) . map (\(n, d) -> (toRational n, toRational d)) . filter (uncurry cancels) $ [(x, y) | x <- non10s, y <- filter (>x) non10s]
