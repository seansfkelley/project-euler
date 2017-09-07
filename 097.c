#include <stdio.h>

int main(){
  long l = 28433;
  int i;
  for (i = 0; i < 7830457; ++i){
    l <<= 1;
    l %= 10000000000;
  }
  l++;
  printf("%ld\n", l);
}
