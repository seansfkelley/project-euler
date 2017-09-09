-- TODO: Force the usage of Integer rather than Int if it's not being used already.
-- TODO: Don't use logbase because it's not precise enough -- reimplement digit counter for Integer?
findFib f0 f1 i = if logBase 10 f0 >= 1000
                  then i
                  else findFib f1 (f0 + f1) (i + 1)

main = print $ findFib 1 1 1
