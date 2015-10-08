#include <iostream>
#include <stdio.h>
#include <string>
#include <stack>
#include <Math.h>
#include <sstream>
#include <vector>

#define MAXN 25
#define CORES 3
#define INF 1000000
 
using namespace std;

class RGBStreet{

	int a[MAXN][CORES];
	int pd[MAXN][CORES];
	int size;

	public:
	int estimateCost(vector<string> houses){

			for(int i =0; i < MAXN;i++)
				for(int j =0; j < CORES;j++)
					pd[i][j] = INF;

				size = houses.size();
				toInt(houses);

				int r = func(0,0);
				int g = func(1,0);
				int b = func(2,0);
				int ret = min(min(r,g),b);
				printf("%d\n",ret);
				return ret;
				
				
	}
	

		  
	void toInt(vector<string> s){

			for(int i = 0 ; i < size ;i++){
					for(int k =0;k<CORES;k++){

						string r = s[i].substr(0,s[i].find(" "));
						s[i].erase(0,r.length()+1);

								stringstream convert(r); 
								int value;
									convert>>value;
									a[i][k] = value;

						
					}
				}
			}


	int func(int cor , int n){
 
			if(n == size ){
						pd[n][cor] = a[n][cor];
							return pd[n][cor];							
							
								}else{					
									if(cor == 0){
											if( pd[n][cor] == INF ){
												pd[n][cor] = min(func(1,n+1),func(2,n+1)) + a[n][cor];
										}
									}
								if(cor == 1){
										if( pd[n][cor] == INF ){
												pd[n][cor] = min(func(0,n+1),func(2,n+1)) + a[n][cor];
										}
									}
								if(cor == 2){
										if( pd[n][cor] == INF ){
												pd[n][cor] = min(func(0,n+1),func(1,n+1)) + a[n][cor];
										}
									}
							return pd[n][cor];			     
					 }

}

}; 


 
int main(){

 				 	vector<string> values;
					values.push_back("1 100 100");
					values.push_back("100 1 100");
					values.push_back("100 100 1");


					RGBStreet * s = new RGBStreet();
					s->estimateCost(values);
    			  
        return 0;
 
}
