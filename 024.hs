import Utils

nthPermutation [] 0 = ""
nthPermutation [] n = error "Should only get index = 0 when there are no values left to choose."
nthPermutation values index =
  let
    f = factorial $ (length values) - 1
    i = index `div` f
  in
    (values !! i) : (nthPermutation (splice i values) (index - f * i))

-- Off-by-one here; the problem uses 1-indexing but we don't so use 999999 instead of 1000000.
main = print $ nthPermutation "0123456789" 999999
