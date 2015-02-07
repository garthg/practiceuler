$prev1=1
$prev2=1
$next=2
$sum=0
$max = 4*10**6

while $next < $max
  puts "term #$next"
  if $next%2 == 0
    $sum += $next
    puts "sum #$sum"
  end
  $prev2 = $prev1
  $prev1 = $next
  $next = $prev1+$prev2
end
