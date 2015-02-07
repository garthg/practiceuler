# Build a list of all the palindromes. Check if each one is the product of
# two three-digit numbers by dividing each by every three digit number.
# O( n^2 ) for n = 10^digits
# Actually ends up checking 93 palindromes for 3 digits.
# Takes under 1 second for 4 digits number on macbook pro.

def maxpalindrome(digits)
  # Maximum first half of palindrome number is the first three digits of the
  # square of the maximum n-digit number.
  counter=0
  maxhalfpal = (10**digits-1)**2 / 10**digits
  i=maxhalfpal
  minfactor = 10**(digits-1)
  maxfactor = 10**digits-1
  while i>minfactor
    curr = i*10**digits
    for j in 0..digits-1
      adder = (i/10**j % 10) * 10**(digits-j-1)
      curr += adder
    end
    curr = Float(curr)
    counter+=1
    for j in minfactor..maxfactor
      res = curr / Float(j)
      if res % 1 == 0 and res >= minfactor and res <= maxfactor
        p counter
        return Integer(curr)
      end
    end
    i-=1
  end
end

digits = 3  # Should be 906609
#digits = 4
#digits = 2
p maxpalindrome(digits)


# Build a list of all the 3-digit products. Sort them. Check for palindromes
# from top to bottom. O( n^2 log n )
# Takes 15 seconds for 4 digits on macbook pro.
def maxpalindrome2(digits)
  minfactor = 10**(digits-1)
  maxfactor = 10**digits-1
  products = []
  for i in minfactor..maxfactor
    for j in i..maxfactor
      products.push(i*j)
    end
  end
  products = products.sort!.reverse!
  products.each do |i|
    istr = i.to_s
    if istr == istr.reverse
      return i
    end
  end
end
#p maxpalindrome2(digits)


# First idea:
# Monontically decreasing product of two 3-digit numbers, then check for
# palindrome. This doesn't work because it's hard to get a monotonic order of
# products.
