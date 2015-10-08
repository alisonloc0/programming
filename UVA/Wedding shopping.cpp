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
#define MAXN 210
#define MAXC 25
#define INF -999999999
using namespace std;

int pd[MAXN][MAXC]; 
vector<int> prices[MAXC];
int C,T;

int func(int M,int k){

  if(pd[M][k] != -1 ){
    return pd[M][k];
  }
 
  if(k+1 == C){
    return 0;
  }

  int ans = INF;
  for(int i = 0;(i<prices[k+1].size());i++){
    int b = M-prices[k+1][i];
    if(b>=0)
      ans = max(ans,prices[k+1][i]+func(b,k+1));
  }
  pd[M][k] = ans;
  return ans;
}

int main(){

  scanf("%d",&T);
  for(int i=0;i<T;i++){

    for(int k =0;k<MAXN;k++){
      for(int l=0;l<MAXC;l++){
	pd[k][l] = -1;
	prices[l].clear();
      }
    }
    
    int M;
    int lowT = 0;

    scanf("%d %d",&M,&C);

    for(int j=0;j<C;j++){
      int v;
      int low = -INF;

      scanf("%d",&v);
      for(int k=0;k<v;k++){
	int ki;
	scanf("%d",&ki);
	prices[j].push_back(ki);
	low = min(low,ki);
      }
      lowT+=low;
    }	
    if(lowT>M){
      cout<<"no solution"<<endl;
      continue;
    }
    
    int ans = INF;
    for(int k = 0;k<prices[0].size();k++){
      int b = M-prices[0][k];
      if(b>=0){
	ans = max(ans,prices[0][k]+func(b,0));
      }
    }
    cout<<ans<<endl;
  }
  return 0;
}
