# alternative solution to problem 1
# turns out to be slower
#
# find all multiples of 3 less than 1000
# find all multiples of 5 less than 1000
# add up all those numbers

$cutoff = 1000

$i=0
$sum=0
while $i*3 < $cutoff-3 do
  $i += 1
  $incr = $i*3
  $sum += $incr
  puts "Loop i=#$i incr=#$incr sum=#$sum"
end
$i=0
while $i*5 < $cutoff-5 do
  $i += 1
  $incr = $i*5
  $sum += $incr
  puts "Loop i=#$i incr=#$incr sum=#$sum"
end
$i=0
while $i*15 < $cutoff-15 do
  $i += 1
  $decr = $i*15
  $sum -= $decr
  puts "Loop i=#$i decr=#$decr sum=#$sum"
end
puts $sum
