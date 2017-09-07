grid = list([0] * 20 + [1] for i in xrange(20)) + [[1] * 21]

print grid

for i in xrange(20):
  i = 19 - i
  for j in xrange(20):
    j = 19 - j
    grid[i][j] = grid[i+1][j] + grid[i][j+1]

print grid
