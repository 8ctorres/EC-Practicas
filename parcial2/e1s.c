#define N 500
float a[N][N], r;
int i,j;

int main(){
  for(i=0; i<N; i++){
    for(j=0; j<N; j++){
      a[i][j] = i+j;
      r+= a[i][j];
    }
  }

  a[0][0]=r;
}
