{-

It can be seen that a lamina of this definition can never have an odd number of tiles. Each concentric square ring has an even number of tiles: baseline 4 for each corner, plus 4*width for some integer width. Furthermore, the next largest ring after some given ring is always exactly 8 tiles larger than the previous: each of 4 sides needs to be 2 tiles longer to surround the previous ring.

The only problematic cases are the degenerate ones of 1 tile and 4 tiles, both of which are specifically banned by the problem as they are the smallest rings in the odd- and even-parity (respectively) ring sets, which mean they must always be absent if we are to have a hollow lamina.

For odd-parity laminae, the number of tiles is t_odd(i) = 8i.
For even-parity laminae, the number of tiles is t_even(i) = 8i + 4.

(Where i = 0 is the degenerate innermost ring and i = 1 is the first valid ring.)

For some number of tiles, we can then formulate the laminae-counting function as follows:

count(n) = the number of ways n can be written as a sum of consecutive terms of either of the series 8i or 8i + 4 (for n >= 8, the smallest legal ring).

Since we know that rings always have an even number of tiles, and laminae are sums of rings, count(n) for n odd is always zero.

The problem can then be reformulated as sum(count(n)) for even n in [8, 1000000].

-}
