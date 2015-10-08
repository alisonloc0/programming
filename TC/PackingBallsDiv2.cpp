#include <iostream>
#include <cmath>
#include <stdio.h>
#include <vector>

#define INF 100000.0
#define MAXN 110

using namespace std;
class PackingBallsDiv2{

	int pd[MAXN][MAXN][MAXN];

	public:
	int minPacks(int r, int g, int b){

		for(int i =0;i<MAXN;i++)
			for(int j =0;j<MAXN;j++)		 
				for(int k=0;k<MAXN;k++)
						pd[i][j][k] = INF;
		return func(r,g,b);
	}	
	
	int func(int r, int g,int b){

		if(r == 0 && g == 0 && b == 0)
			return 0;

		if(r<0 || g<0 || b<0)
			return INF;

		if(pd[r][g][b] != INF)
			return pd[r][g][b];

		int best = INF;
		best = min(best,1+func(r-1,g,b));		
		best = min(best,1+func(r,g-1,b));		
		best = min(best,1+func(r,g,b-1));		
		best = min(best,1+func(r-1,g-1,b));		
		best = min(best,1+func(r-1,g,b-1));		
		best = min(best,1+func(r,g-1,b-1));		
		best = min(best,1+func(r-3,g,b));		
		best = min(best,1+func(r,g-3,b));		
		best = min(best,1+func(r,g,b-3));		
		best = min(best,1+func(r-1,g-1,b-1));		

		pd[r][g][b] = best;

		return pd[r][g][b];
		
	}
	
};




int main () {

	
	PackingBallsDiv2 * p = new PackingBallsDiv2();
	cout<<p->minPacks(100,100,100)<<endl;


  return 0; 
}
