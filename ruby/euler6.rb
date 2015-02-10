# Sum square difference
x=100
def sumsquarediff(x)
  return (((x*x+x)**2)/4).to_i - ((x*(x+1)*(2*x+1))/6)
end
p sumsquarediff(x)
# One liner
#p (((x*x+x)**2)/4).to_i - ((x*(x+1)*(2*x+1))/6)
