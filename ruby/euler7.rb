# Find primes
#
# Brute force or attempted sieve. Sieve turned out to be slower.

require_relative 'primefactorize'

# For 10001 should be 104743
target = 10001  # nth prime number

def brute(target)
  primes = []
  curr = 2
  while primes.length < target
    factors = primefactorize(curr)
    if (factors.length == 0 or 
        (factors.keys.length < 2 and factors.values.reduce(:+) == 1))
      primes.push(curr)
    end
    curr += 1
  end
  return primes
end
primes = brute(target)
p primes[-1]


=begin
/* Turns out to be slower */
primes = []
composites = []
currmax = 2
currcheck = currmax
candidates = [1, 1]
checks = 0
while primes.length < target
  candidates = candidates + Array.new(currmax-currcheck,1)
  composites.each { |k|
    curr = k
    while curr < currmax
      candidates[curr] = 0
      curr *= k
    end
  }
  #p '---'
  #p primes.length
  #p candidates.length
  for i in currcheck..currmax
    if candidates[i] == 0
      next
    end
    checks += 1
    factors = primefactorize(i)
    if factors.length == 0 or factors.values.reduce(:+) == 1
      primes.push(i)
    else
      composites.push(i)
    end
    ([i] + factors.keys).each { |k|
      curr = k
      while curr < currmax
        candidates[curr] = 0
        curr *= k
      end
    }
    if primes.length >= target
      break
    end
  end
  currcheck = currmax + 1
  currmax *= 2
end
p '-----'
p checks
p candidates.length
p primes.length
p primes[-1]
=end
