# Algebra on two equations:
# a^2 + b^2 = c^2
# a+b+c = 1000
#
# sqrt(a^2 + b^2) = 1000-(a+b)
# a^2+b^2 = 1000^2 - 2000(a+b) + a^2 + 2ab + b^2
# 0 = 1000^2 - 2000a - 2000b + 2ab
# 2000b - 2ab = 1000^2 - 2000a
# b(2000-2a) = 1000^2 - 2000a
# b = (1000^2 - 2000a) / (2000-2a)
# b = (500000 - 1000a) / (1000-a)
#
# 0 = a^2 + b^2 - c^2
#   = a^2 + b^2 - (1000-b-a)^2
#   = a^2 + ((500000-1000a)/(1000-a))^2 - (1000-(500000-1000a)/(1000-a)-a)^2
#
# Then look for satisfying integers.

import math

def Fit(a):
  a = float(a)
  if (0 == (
      ( (500000-1000*a)/(1000-a) )**2 + a**2 -
      ( 1000 - ( (500000-1000*a)/(1000-a) ) - a)**2
      )):
    b = (500000-1000*a)/(1000-a)
    if b > 0:
      if a%1==0 and b%1==0 and a < b:
        return (int(a), int(b))
  return None

 
for i in range(1,1000):
  res = Fit(i)
  if res:
    a,b = res
    c = math.sqrt(a**2 + b**2)
    print 'a=%f b=%f c=%f' % (a, b, c)
    print 'pyth? %s' % (str(a**2+b**2==c**2))
    print 'sum: %f' % (a+b+c)
    prod = (a*b*c)
    print 'prod: %d (%f)' % (int(a*b*c), (a*b*c))

