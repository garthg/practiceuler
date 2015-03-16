
def Ackermann(m,n):
  if m==0: return n+1
  if m>0 and n==0: return Ackermann(m-1,1)
  if m>0 and n>0: return Ackermann(m-1,Ackermann(m,n-1))
  raise ValueError('Expected m>=0 and n>=0 for Ackermann(m,n).')

if __name__ == '__main__':
  import sys
  print Ackermann(int(sys.argv[1]), int(sys.argv[2]))
