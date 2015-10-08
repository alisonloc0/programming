#include <iostream>
#include <cmath>
#include <stdio.h>
#include <vector>

#define INF -100000.0
#define MAXN 110

using namespace std;

class PillarsDivTwo{

double pd[MAXN][MAXN];

		public:

		vector<int>h;
		int w;
		int p;

		
		double maximalLength(vector<int> height, int w_){

		   for( int i = 0; i < MAXN ; i++)
						   for( int j = 0; j < MAXN ; j++)		   		
				          pd[i][j]  = INF;

			w = w_;
			p = height.size();
			h = height;

			return func(0,0);
						
		}
		
		double func(int n,int a){

    		if ( n == p-1)
      		  return 0;
      		  
    		if( pd[n][a] != INF )
      		  return pd[n][a];
      		  
			double f = INF;

		  for(int i =1;i<=h[n];i++){

			    double b = INF;
					for(int k = 1;k<=h[n+1];k++){
	  		         b  = max(b ,sqrt(w*w + abs((i-k)*(i-k))) +func(n+1,k));
					}
					pd[n][i] = b;
					f = max(f,pd[n][i]);
		   }    
    	
    		return f;

		}

};


int main () {
 	vector<int> a;
 		a.push_back(5);
		a.push_back(6);
		a.push_back(7);
		a.push_back(8);
		a.push_back(9);
		a.push_back(10);
		a.push_back(11);
		a.push_back(12);
		a.push_back(13);
		a.push_back(14);
		a.push_back(15);
		
	PillarsDivTwo * p = new PillarsDivTwo();
	cout<<p->maximalLength(a,20)<<endl;

  return 0; 
}
