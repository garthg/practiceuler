import operator


def ncr(n,r):
  r = min(r, n-r)
  if r == 0: return 1
  numer = reduce(operator.mul, xrange(n, n-r, -1))
  denom = reduce(operator.mul, xrange(1, r+1))
  return numer//denom


def f(num_colors, num_balls_per_color, num_draw):
  output = {}
  for i in xrange(1,num_colors):
    if i*num_balls_per_color < num_draw:
      output[i] = 0
    else:
      output[i] = ncr(num_colors, i) * f(i, num_balls_per_color, num_draw)[i]
  total = ncr(num_colors*num_balls_per_color, num_draw)
  output[num_colors] = total - sum(output.itervalues())
  return output


result = f(7, 10, 20)
print result

numer = sum([k*v for k,v in result.items()])
denom = sum(result.values())

print float(numer)/denom

# Expected number of balls is
# E[red + orange + ... + violet]
# Because expectation is linear, this is equivalent to
# E[red] + E[orange] + ... + E[violet]
# Because of symmetry, this is equivalent to
# 7 * E[red]
#
# E[red] is the probablity that any red is picked
# To pick all non-red, there are 60choose20 ways
# There are 70choose20 total possible ways to pick 20 balls
# Thus E[red] = 1 - 60choose20 / 70choose20
# Final answer is 7 * ( 1 - 60choose20 / 70choose20 )

print 7 * ( 1 - float(ncr(60, 20)) / ncr(70, 20) )
