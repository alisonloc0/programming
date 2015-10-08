#include <stdio.h>
#include <iostream>
#include <cstring>
#include <queue>
#include <cmath>
#include <vector>
#include <set>
#include <utility>
#include <bitset>
#include <cstdlib>
#define MAXN 1010
#define MAXM 10010
#define MAXC 110
#define INF 1000000000
using namespace std;

int main(){
    srand(time(NULL));
    int N = rand()%100 +1;
    int M = rand()%1000 +1;
    cout << N << " "<< M << endl;
    for(int i =0;i<N;i++)
      cout << rand()%100 +1 << " ";
    cout << endl;
    for(int i=0;i<M;i++){
      int v = rand()%N;
      int w = v;
      while(w == v)
	w = rand()%N;
      int d = rand()%100 +1;
      cout << v << " " << w << " " << d << endl;
    }
    int k = rand()%100 +1;
    cout << k << endl;
    for(int i=0;i<k;i++){
      int c = rand()%100 +1;
      int v = rand()%N;
      int w = rand()%N;
      cout << c << " " << v << " " << w << endl;
    }
    
}
