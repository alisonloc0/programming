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

vector< pair<int,int> >list[MAXN];
vector<int> p;
int S,T,C;			
int cost[MAXN][MAXC]; 

struct foo{
  int v,c,f;
  bool operator <(const foo& A) const{
    return A.c > c;
  }
};

int sssp(){
  int ans = INF;
  priority_queue<foo>pq;
  pq.push((foo){S,0,0});
  while(!pq.empty()){
    struct foo curr = pq.top();pq.pop();
    curr.c *=-1;
    if( curr.v == T ){
      ans = min(ans,curr.c);
      break;
    }
    if(curr.c > cost[curr.v][curr.f])
      continue;

    for(int k=0;k<list[curr.v].size();k++){
      pair<int,int> edge = list[curr.v][k];
      int w = edge.first;
      int d = edge.second;
      int i = 0;
      if(curr.f - d < 0) i = abs(curr.f - d);
      for(;curr.f + i <= C;i++){
	if(curr.c + p[curr.v]*i < cost[w][curr.f+i - d]){
	  pq.push((foo){w,(curr.c + p[curr.v]*i)*(-1),curr.f + i - d });
	  cost[w][curr.f+i-d] = curr.c + p[curr.v]*i; 
	}
      }
    }
  }
  return ans;
}

int main(){
  int N,M;
  cin >> N >> M;
  for(int i=0;i<N;i++){
    int x;
    cin >> x;
    p.push_back(x);
  }
  for(int i=0;i<M;i++){
    int v,w,d;
    cin >> v >> w >> d;
    list[v].push_back(make_pair(w,d));
    list[w].push_back(make_pair(v,d));
  }
  int k; cin >> k;
  for(int q=0;q<k;q++){
    scanf("%d %d %d",&C,&S,&T);
    for(int i=0;i<=N;i++){
      for(int j=0;j<=C;j++){
	cost[i][j] = INF;
      }
    }
    cost[S][0] = 0;
    int ans = sssp();
    if( ans == INF)
      cout << "impossible" << endl;
    else
      cout << ans << endl;
  }
  return 0;
}
