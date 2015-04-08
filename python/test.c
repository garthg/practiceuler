#include <math.h>
#include <stdio.h>
int main() {
  long maxval;
  long i;
  long cumsum;
  maxval = (5 * pow((double)10, 10));
  printf("%ld\n",maxval);
  //maxval = 50;
  cumsum = 0;
  for (i=0; i<maxval; i++) {
    cumsum += i;
  }
  printf("%ld\n",cumsum);
}
