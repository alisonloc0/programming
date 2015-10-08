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
#define MAXN 110
#define MAXM 60
#define INF -999999999
#define LL long long

using namespace std;
LL pd[MAXN][MAXN][MAXM];

int xi[16] = {0,0,-1,1,1,1,-1,-1,-2,-2,2,2,-1,1,-1,1};
int yi[16] = {-1,1,0,0,-1,1,-1,1,-1,1,-1,1,-2,-2,2,2};

class ChessMetric{
public:
  LL howMany(int size,vector<int>start,vector<int>end,int M){

    memset(pd,0,sizeof(pd));
    
    int x = start[0];
    int y = start[1];
    int xf = end[0];
    int yf = end[1];

    // base case
    pd[x][y][0] = 1;
    for(int m=1;m<=M;m++){
      for(int i =0;i<size;i++){
	for(int j=0;j<size;j++){
	  if(pd[i][j][m-1]!= 0){
	    for(int k=0;k<16;k++){
	      int x0 = i+xi[k];
	      int y0 = j+yi[k];
	      if(is(x0,y0,size)){
		pd[x0][y0][m]+=pd[i][j][m-1];
	      }
	    }
	  }
	}
      }
    }
    LL ans = pd[xf][yf][M];
    return ans;
  }

  bool is(int x, int y,int bound){
    if(x>=0 && x<bound && y>=0 && y<bound){
      return true;
    }else
      return false;
  }

  
};
int main(){

  ChessMetric * c = new ChessMetric();
  int size =8;
  vector<int> start;
  vector<int> end;
  start.push_back(2);
  start.push_back(3);
  end.push_back(7);
  end.push_back(7);
  int moves = 9;
  cout <<c->howMany(size,start,end,moves)<<endl;
  return 0;
}
