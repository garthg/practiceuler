# Number field sieve.

maxnum = 2e6
#maxnum = 10
#maxnum=3e1
numbers = Array.new(maxnum+1,1)
output = [] 
print "Running..."
for i in 2..maxnum+1
  #if i % 100 == 0
  #  print ("\rRunning... %.1f%%" % (100.0*i/maxnum))
  #end
  if numbers[i] == 1
    output << i
    j=i+i
    while j <= maxnum
      numbers[j] = 0
      j+=i
    end
  end
end
print "\n"

#p output
p output.reduce(:+)
