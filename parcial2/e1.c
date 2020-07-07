#define N 500
float a[N][N], r;
int i,j;

int main(){
  for(i=0; i<N; i++){
    for(j=0; j<N; j++){
      a[i][j] = i+j;
    }
  }

  for(i=(N-1); i>=0; i--){
    for(j=(N-1); j>=0; j--){
      r+= a[i][j];
    }
  }

  a[0][0]=r;
}
