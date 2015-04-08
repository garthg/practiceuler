import collections


def primefactors(n):
  factors = collections.defaultdict(int)
  factor = 2
  remainder = n
  while factor*factor <= remainder:
    while remainder % factor == 0:
      remainder = remainder // factor
      factors[factor] += 1
    factor += 1
  if remainder != 1:
    factors[remainder] += 1
  return dict(factors)


if __name__ == '__main__':
  import sys
  print primefactors(int(sys.argv[1]))
