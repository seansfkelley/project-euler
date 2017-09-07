GROUP_NAMES = [
  (1000, 'thousand'),
  # for funsies, American-style names
  (1000000, 'million'),
  (1000000000, 'billion'),
]

SMALL_GROUP_NAMES = [
  (20, 'twenty'),
  (30, 'thirty'),
  (40, 'forty'),
  (50, 'fifty'),
  (60, 'sixty'),
  (70, 'seventy'),
  (80, 'eighty'),
  (90, 'ninety'),
]

BASE_NAMES = {
  1: 'one',
  2: 'two',
  3: 'three',
  4: 'four',
  5: 'five',
  6: 'six',
  7: 'seven',
  8: 'eight',
  9: 'nine',
  10: 'ten',
  11: 'eleven',
  12: 'twelve',
  13: 'thirteen',
  14: 'fourteen',
  15: 'fifteen',
  16: 'sixteen',
  17: 'seventeen',
  18: 'eighteen',
  19: 'nineteen',
}

def english_name(n, prefix_and_for_small_values = False):
  # print n,

  if n == 0:
    # let's just pretend we'll never be asked for zero...
    return ''

  for value, name in reversed(GROUP_NAMES):
    if n >= value:
      # print 'group', value, name
      return "%s %s %s" % (english_name(n / value), name, english_name(n % value, True))

  if n in BASE_NAMES:
    # print 'base', n, BASE_NAMES[n]
    return "%s%s" % ('and ' if prefix_and_for_small_values else '', BASE_NAMES[n])

  assert n < 1000

  if n >= 100:
    # print 'hundreds'
    return "%s hundred %s" % (english_name(n / 100), english_name(n % 100, True))
  else:
    for value, name in reversed(SMALL_GROUP_NAMES):
      if n >= value:
        # print 'tens'
        return "%s%s %s" % ('and ' if prefix_and_for_small_values else '', name, english_name(n % value))

  raise ValueError

print len(''.join(map(english_name, xrange(1, 1001))).replace(' ', ''))
