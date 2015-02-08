# Prime factorizer
#
def primefactorize(input)
  factors = Hash.new(0)
  factor = 2
  remainder = input
  while factor*factor <= remainder
    #puts "Factor #factor"
    while remainder % factor == 0
      remainder = remainder/factor
      factors[factor] += 1
    end
    #puts "Remainder #remainder"
    #p factors
    factor += 1
  end
  if remainder != 1
    factors[remainder] += 1
  end
  return factors
end


if __FILE__ == $0
  if ARGV.length > 0
    input = ARGV[0].to_i
  else
    # For Euler Project problem number 3
    input=600851475143 # Should be 6857
  end
  factors = primefactorize(input)
  p factors
  p factors.keys.max
end

