#include <iostream>
#include <cmath>
#include <stdio.h>
#include <vector>
#include <string>
#include <sstream>
#define INF -100000.0
#define MAXN 60

using namespace std;

class ZigZag{

	int pd[MAXN][2];

	public:
	int longestZigZag(vector<int> v){
	
	for(int i =0;i<MAXN;i++)
		for(int j=0;j<2;j++)
				pd[i][j] = 0;

		pd[0][0] = 1;
		pd[0][1] = 1;
		
		for(int i =1;i<v.size();i++){
			for(int j = i-1; j>=0;j--){

				int r = v[i]-v[j];
			
				if(r>0){
						if(pd[i][1]<pd[j][0]+1){
							pd[i][1] = pd[j][0]+1;
						}	
				}
				else if( r<0){
							if(pd[i][0]< pd[j][1]+1){
								pd[i][0] = pd[j][1]+1;
							}
						}else if( r == 0){
										if(pd[i][0] < 1)									
												pd[i][0] = 1;

										if(pd[i][1] < 1)		
												pd[i][1] = 1;
									}
			}
		}
		 return max(pd[v.size()-1][0],	pd[v.size()-1][1]);
	}

	


};

int main () {
 

vector<int> v;

v.push_back(3);
v.push_back(3);
v.push_back(3);


	ZigZag * z = new ZigZag();
	cout << z->longestZigZag(v)<<endl;
	
  return 0; 

  
}
