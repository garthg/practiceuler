# Simple and faster solution.

$i=0
$sum=0
$cutoff=1000
while $i<$cutoff do
  if $i%3==0
    $sum+=$i
    puts "#$i div 3, sum=#$sum"
  elsif $i%5==0
    $sum+=$i
    puts "#$i div 5, sum=#$sum"
  end
  $i+=1
end
puts $sum
