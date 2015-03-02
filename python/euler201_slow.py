import itertools
import sys
from datetime import datetime

gensize = 100
letters = [i*i for i in range(1, gensize+1)]
letters = [1,3,6,8,10,11] # Debug. Should add up to 156.

input_len = len(letters)
subset_size = input_len/2


letter_set = set(letters)
max_sum = sum(letters[-1*subset_size:])
start_time = datetime.utcnow()

print subset_size
print letters
print max_sum

def Bitcount_BAD(u):
  # Deep magic. From:
  # http://stackoverflow.com/questions/8871204/count-number-of-1s-in-binary-representation
  # Doesn't work because of python's int representations.
  ucount = u - ((u >> 1) & 0x033333333333) - ((u >> 2) & 0x011111111111)
  return ((ucount + (ucount >> 3)) & 0x030707070707) % 63

def Bitcount(u):
  return len(str(bin(u))[2:].replace('0',''))

def SumOrNone(a, b):
  if a[0] + b[0] > subset_size: return None
  if a[1] & b[1] > 0: return None
  res = a[1] | b[1]
  return (a[0]+b[0], res)

def Dereference(a):
  inds = str(bin(a[1]))[2:].zfill(len(letters))
  output = []
  for i in range(len(inds)-1,-1,-1):
    if inds[i]=='1': output.append(letters[i])
  return tuple(output)


spellings = {}
uniques = set()

for i in range(1, max_sum+1):
  #spell_by_size = {}
  #for j in range(2, subset_size+1):
  #  pass


  curr_spell = set()
  if i in letter_set:
    ind = letters.index(i)
    spell_self = ['0']*input_len
    spell_self[ind] = '1'
    spell_bin = int('0b'+''.join(spell_self),2)
    curr_spell.add((Bitcount(spell_bin), spell_bin))
  for j in range(1, min([i, i/2+1])):
    for sj in spellings[j]:
      max_si = subset_size - sj[0]
      for si in spellings[i-j]:
        if si[0] > max_si: break
        candidate = SumOrNone(sj, si)
        if candidate: curr_spell.add(candidate)
  spellings[i] = list(curr_spell)
  spellings[i].sort()
  sized_spellings = filter(lambda x: x[0] == subset_size, spellings[i])
  if len(sized_spellings) == 1:
    uniques.add(i)
  if spellings[i]:
    print 'sum %d of %d spelled %d ways' % (i, max_sum, len(spellings[i]))
    #print ','.join([str(Dereference(x)) for x in spellings[i]])
  else:
    print 'sum %d of %d' % (i, max_sum)
  print 'total unique: %d' % len(uniques)
  print 'total time: %s' % (datetime.utcnow() - start_time)

for s in sorted(spellings.keys()):
  curr_spell = spellings[s]
  print '%d: %s' % (s, str([Dereference(x) for x in curr_spell]))
  #if curr_spell:
  #  right_sized = filter(lambda x: x[0] == subset_size, curr_spell)
  #  if right_sized:
  #    print '%d :%s %s' % (s, '*' if len(right_sized)==1 else ' ',
  #        str([Dereference(x) for x in right_sized]))

print '-----'
uniques = list(uniques)
uniques.sort()
print uniques
print '-----'
print sum(uniques)

