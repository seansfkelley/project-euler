def alphabetical(s):
  return sum([ord(c) - 64 for c in s])

with open('names.txt') as f:
  print sum([ (i + 1) * alphabetical(name) for i, name in enumerate(sorted(f.read().replace('"', '').split(','))) ])
