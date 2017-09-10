{-

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

--------

After poking around with differences and averages and trying out combinations, it can be seen that the average
of each square's corners, excluding the first (1), is the middle left value of the square. The first three such
values are 6, 19 and 40. You can then compute the sum of the square by multiplying that value by four.

-}

squareAverage :: Int -> Int
squareAverage n = n ^ 2 - n - (n `div` 2) + 1

main = print $ 1 + 4 * ((sum . map squareAverage . filter odd) [3..1001])
