import math
import collections

class Factorize(object):
  factor_cache = {}
  loop_count = 0

  @staticmethod
  def _factorize(n, factors):
    if n in Factorize.factor_cache:
      cache_res = Factorize.factor_cache[n]
      for f in cache_res:
        factors[f] += cache_res[f]
      return factors
    if n == 1:
      return factors
    #print 'Factor loop: %d' % n 
    Factorize.loop_count += 1
    cutoff = int(math.sqrt(n+.05))+1
    for i in range(2, cutoff):
      if n % i == 0:
        factors[i] += 1
        remainder = n//i
        if not remainder in Factorize.factor_cache:
          Factorize.factorize(remainder)
        return Factorize._factorize(remainder, factors)
    if n != 1:
      factors[n] += 1
    return factors

  @staticmethod
  def factorize(n):
    if n in Factorize.factor_cache:
      #print 'Factor cache hit: %d' % n
      return Factorize.factor_cache[n]
    res = dict(Factorize._factorize(n, collections.defaultdict(int)))
    Factorize.factor_cache[n] = res
    return res

  @staticmethod
  def isprime(factors):
    return (len(factors) == 1 and factors.items()[0][1] == 1)


class Derivative(object):
  derivative_cache = {}

  def _derivative(self, n):
    if n == 1: return 1
    factor_dict = Factorize.factorize(n)
    if Factorize.isprime(factor_dict):
      return 1
    divisor = max(factor_dict.keys())
    other = n//divisor
    return self.derivative(divisor)*other + divisor*self.derivative(other)

  def derivative(self, n):
    if n in self.derivative_cache:
      #print 'Cache hit: %d' % n
      return self.derivative_cache[n]
    res = self._derivative(n)
    self.derivative_cache[n] = res
    return res


def gcd(a, b):
  f_a = Factorize.factorize(a)
  f_b = Factorize.factorize(b)
  res = 1
  for f in f_a:
    if f in f_b:
      m = min(f_a[f], f_b[f])
      res *= f**m
  return res


if __name__ == '__main__':
  import sys
  from datetime import datetime
  #f = Factorize()
  #for x in sys.argv[1:]:
  #  print f.factorize(int(x))
  #print f.prime_cache
  #d = Derivative()
  #print d.derivative(int(sys.argv[1]))

  #kmax = 10
  #kmax = 5*10**5
  #exp = int(sys.argv[1])
  #kmax = 5*10**exp
  kmax = int(sys.argv[1])
  cumsum = 0
  starttime = datetime.utcnow()
  d = Derivative()
  gcds = []
  for k in xrange(1, kmax+1):
    #sys.stdout.flush()
    #print '%d/%d (looped %d) in %s' % (
    #    k, kmax, Factorize.loop_count, str(datetime.utcnow() - starttime))
    curr = gcd(k, d.derivative(k))
    gcds.append(curr)
    cumsum += curr
    #cumsum += k
  #print '5 * 10^%d = %d' % (exp, kmax)
  print 'Loops: %d' % Factorize.loop_count
  print str(datetime.utcnow() - starttime)
  print gcds
  print cumsum
  if len(sys.argv) > 2:
    print gcds[int(sys.argv[2])-1]

