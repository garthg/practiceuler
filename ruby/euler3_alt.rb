# From http://www.mathblog.dk/project-euler-problem-3/
#
# Same as my solution just slightly different use of incrementing in while loop
# and does not store all the factors. I missed the square root trick though so
# I had to add that.
#
# It appeared to run slower but that was just the print statements and the
# array pushes.


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
