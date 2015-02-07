prev1=1
prev2=1
curr=2
sum=0
max = 4*10**6

while curr < max
  puts "term #{curr}"
  if curr%2 == 0
    sum += curr
    puts "sum #{sum}"
  end
  prev2 = prev1
  prev1 = curr
  curr = prev1+prev2
end
p sum # 4613732

