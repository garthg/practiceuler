# Simpler solution, slower on larger numbers.

#cutoff=10000000  # Took over 1 second on macbook pro.
cutoff=1000  # Answer 233168
i=0
sum=0
while i<cutoff do
  if i%3==0
    sum+=i
    #puts "#{i} div 3, sum=#{sum}"
  elsif i%5==0
    sum+=i
    #puts "#{i} div 5, sum=#{sum}"
  end
  i+=1
end
p sum
