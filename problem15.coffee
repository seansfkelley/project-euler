grid = ((0 for i in [0...20]).concat(1) for i in [0...20]).concat([1 for i in [0...21]])

for i in [0...20]
  i = 19 - i
  for j in [0...20]
    j = 19 - j
    grid[i][j] = grid[i+1][j] + grid[i][j+1]
console.log grid
