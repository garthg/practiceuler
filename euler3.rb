input=600851475143

factors ||= []
factor=2
remainder=input
while factor*factor < remainder
  #puts "Factor #factor"
  while remainder % factor == 0
    remainder = remainder/factor
    if not factors.last == factor
      factors << factor
    end
  end
  #puts "Remainder #remainder"
  #p factors
  factor += 1
end
if remainder != 1
  factors << remainder
end
p factors
p factors.last
