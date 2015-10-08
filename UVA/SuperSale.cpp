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
#include <sstream>  
#define MAXW 35
#define MAXN 1010
#define INF -999999999
#define LL long long

using namespace std;

int pd[MAXW][MAXN];

int main(){
  int t,n,k;
  cin >> t;
  for(int i=0;i<t;i++){
    vector<pair<int,int> > values;
    vector<int> g;
    memset(pd,0,sizeof(pd));

    cin >> n ;
    for(int j=0;j<n;j++){
      int c,w;
      cin >> c >> w;
      values.push_back(make_pair(c,w));
    }
    cin >> k;
    for(int j=0;j<k;j++){
      int v1;
      cin >> v1;
      g.push_back(v1);
    }
    
    for(int j=1;j<=values.size();j++){
      int c = values[j-1].first;
      int w = values[j-1].second;
      
      for(int s=0;s<MAXW;s++){
	if(w <= s){
	  pd[s][j] = max(pd[s][j-1],c+pd[s-w][j-1]);
	}else
	  pd[s][j] = pd[s][j-1];
      }
    }

    int sum = 0;
    for(int j=0;j<g.size();j++){
      sum+=pd[g[j]][values.size()];
    }
    cout << sum << endl;

  }
  return 0;
}
