require_relative 'primefactorize'
input=600851475143 # Should be 6857
factors = primefactorize(input)
p factors
p factors.keys.max
