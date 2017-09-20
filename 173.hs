{-

It can be seen that a lamina of this definition can never have an odd number of tiles. Each concentric square ring has an even number of tiles: baseline 4 for each corner, plus 4*width for some integer width. Furthermore, the next largest ring after some given ring is always exactly 8 tiles larger than the previous: each of 4 sides needs to be 2 tiles longer to surround the previous ring.

The only problematic cases are the degenerate ones of 1 tile and 4 tiles, both of which are specifically banned by the problem as they are the smallest rings in the odd- and even-parity (respectively) ring sets, which mean they must always be absent if we are to have a hollow lamina.

For rings in odd-parity laminae, the number of tiles is t_odd(i) = 8i.
For rings in even-parity laminae, the number of tiles is t_even(i) = 8i + 4.

(Where i = 0 is the degenerate innermost ring and i = 1 is the first valid ring.)

For some number of tiles, we can then formulate the laminae-counting function as follows:

    count(n) = the number of ways n can be written as a sum of consecutive terms of either of the series 8i or 8i + 4 (for n >= 8, the smallest legal ring, and i > 0).

Since we know that rings are always mutiples of four in tile count, and laminae are sums of rings, count(n) for n not a multiple of four is always zero.

The problem can then be reformulated as sum(count(n)) for n in [8,12..1000000].

ALTERNATELY

In the case of even-parity laminae, where every ring is 8i, we can divide all the values by 8 and restate this half of the problem as follows:

    count(n) = how many different ways you can write each positive integer less than or equal to n as a sum of consecutive positive integers

Some examples:

    count(1) = 1; (1)
    count(2) = 2; (1), (2)
    count(3) = 4; (1), (2), (3), (1 + 2)
    count(4) = 5; (1) ... (4), (1 + 2)
    count(5) = 7; (1) ... (5), (1 + 2), (2 + 3)
    count(6) = 9; (1) ... (6), (1 + 2), (2 + 3), (1 + 2 + 3)

You could also approach this problem with "strictly equals" instead of "less than or equal", which would yield these values:

    count'(1) = 1; (1)
    count'(2) = 1; (2)
    count'(3) = 2; (3), (1 + 2)
    ...
    count'(6) = 2; (6), (1 + 2 + 3)

And therefore count(n) = sum(count'(i) for i in [1..n]).

The easiest (but not necessarily fastest) way to generate this is probably something along the lines of:

count = 0
for i in [1..n]:
  acc = 0
  j = 0
  while acc <= n:
    acc += i + j
    if acc <= n:
      j += 1
  count += j
-}
