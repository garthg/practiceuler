# From http://www.mathblog.dk/project-euler-problem-3/
# Faster than my solution.


$input=600851475143
$newnum = $input
$factor = 0

$i=2
while ($i*$i <= $newnum)
  if $newnum % $i == 0
    $newnum = $newnum / $i
    $factor = $i
  else
    $i += 1
  end
end
if $newnum > $factor
  $factor = $newnum
end
p $factor
