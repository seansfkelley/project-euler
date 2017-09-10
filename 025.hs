findFib :: Integer -> Integer -> Int -> Int
findFib f0 f1 i = if (length . show) f0 >= 1000
                  then i
                  else findFib f1 (f0 + f1) (i + 1)

main = print $ findFib 1 1 1
