#include <stdio.h>
#define N 2000
int i,j;
int a[N][N];
int main(){
  for (j=0; j<(N-1); j++){
    for (i=0; i< (N-1); i++){
      a[j][i] = a[j+1][i-1];
    }
  }

  for (int k=0; k<N; k++)
    for (int m=0; m<N; m++)
      printf("%d",a[k][m]);
}
