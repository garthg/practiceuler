# Model is sums x numpositive, update for each letter

# Initialize with all empty dicts
# Step:
# for each letter
#   make new status dict
#   for each nonempty sum key in prev
#     make copy of dict for new value
#     for each numpositive < subsetsize
#       in new dict, in numpositive+1 key, update the value:
#       if had value, mark collision
#       if had no value, set as old dict value append curr letter
#   add entry for the letter itself
#   set updates in status dict

# Final:
# for each sum, if numpositive key of subset size is not collision, that is
# an output.

import collections
import copy


gensize = 100  # Should be 115039000 in ~150 seconds
#gensize = 50  # Should be 7383100 in ~5 seconds
#gensize = 35  # Should be 1461465 in ~1 seconds
letters = [i*i for i in range(1, gensize+1)]
#letters = [1,3,6,8,10,11]  # Should be 156
subset_size = len(letters)/2


def Spellings(letters, max_subset_size):
  data = {}
  for i in xrange(len(letters)):
    letter = letters[i]
    updates = {}
    for key_sum in data:
      subset_dict = data[key_sum]
      key_subset_to_do = filter(lambda x: x < subset_size, subset_dict.keys())
      if key_subset_to_do:
        output_sum = key_sum + letter
        if output_sum in updates:
          output_update = updates[output_sum]
        else:
          if output_sum in data:
            output_update = copy.copy(data[output_sum])
          else:
            output_update = {}
        for key_subset in key_subset_to_do:
          key_subset_update = key_subset+1
          if key_subset_update in output_update:
            output_val = 'X'
          else:
            if subset_dict[key_subset] == 'X':
              output_val = 'X'
            else:
              output_val = subset_dict[key_subset]+','+str(letter)
          output_update[key_subset_update] = output_val
        updates[output_sum] = output_update
    if letter in updates:
      updates[letter][1] = str(letter)
    else:
      if letter in data:
        data[letter][1] = str(letter)
      else:
        data[letter] = {1:str(letter)}
    for update in updates:
      data[update] = updates[update]
    print 'iter %d/%d data size %d after %d updates' % (i+1, len(letters),
        len(data), len(updates))
  return data


data = Spellings(letters, subset_size)
# Print results
#for key_sum, val_sum in data.iteritems():
#  if subset_size in val_sum:
#    if val_sum[subset_size] != 'X':
#      print '%d : %s' % (key_sum, val_sum[subset_size])
uniques = filter(
    lambda x: subset_size in data[x] and data[x][subset_size] != 'X',
    data.keys())
uniques.sort()
print uniques
print sum(uniques)


