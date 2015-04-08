import string
import collections
import itertools

num_balls_per_color = 4
num_colors = 4

num_draw = 2 * num_balls_per_color
num_balls = num_balls_per_color * num_colors

colors = string.letters[0:num_colors]
ball_colors = ''.join(
    [colors[i]*num_balls_per_color for i in xrange(num_colors)])

print ball_colors
print '--'

balls = range(0, num_balls)
draws = list(itertools.combinations(balls, num_draw))
print 'Unique draws: %d' % len(draws)
draw_balls = [''.join([ball_colors[x] for x in d]) for d in draws]
distincts = [len(set([ball_colors[x] for x in d])) for d in draws]
#print '\n'.join(['%d : %s' % (distincts[i], draw_balls[i]) for i in
#  xrange(len(draws))])
print float(sum(distincts))/len(distincts)
counts = collections.Counter(distincts)
print counts.items()
