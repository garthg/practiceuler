# alternative solution to problem 1
# turns out to be about the same speed for 1000, but faster on larger inputs
#
# find all multiples of 3 less than 1000
# find all multiples of 5 less than 1000
# add up all those numbers
#
# should be 233168

#cutoff = 10000000  # Took 0.3 seconds on macbook pro.
cutoff = 1000  # Answer 233168

i=0
sum=0
while i < cutoff do
  incr = i
  sum += incr
  #puts "Loop i=#{i} incr=#{incr} sum=#{sum}"
  i += 3
end
i=0
while i < cutoff do
  incr = i
  sum += incr
  #puts "Loop i=#{i} incr=#{incr} sum=#{sum}"
  i += 5
end
i=0
while i < cutoff do
  decr = i
  sum -= decr
  #puts "Loop i=#{i} decr=#{decr} sum=#{sum}"
  i += 15
end
p sum
