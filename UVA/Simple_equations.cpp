#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <set>
#include <map>
#include <list>
#include <queue>
#include <stack>
#include <memory>
#include <iomanip>
#include <numeric>
#include <functional>
#include <new>
#include <algorithm>
#include <cmath>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <climits>
#include <cctype>
#include <ctime>

#define REP(i, n) for(int (i) = 0; i < n; i++)
#define FOR(i, a, n) for(int (i) = a; i < n; i++)
#define FORR(i, a, n) for(int (i) = a; i <= n; i++)
#define for_each(q, s) for(typeof(s.begin()) q=s.begin(); q!=s.end(); q++)
#define sz(n) n.size()
#define pb(n) push_back(n)
#define all(n) n.begin(), n.end()
#define INT long long
#define INF 10100000

using namespace std;

int ans[4];

void func(int a, int b,int c){

	ans[0]= INF;
	ans[1]= INF;
	ans[2]= INF;
		
	for(int x = -100;x<=100;x++){
		for(int y=-100;y<=100;y++){
			for(int z=-100;z<=100;z++){
				if(x!= y && y !=z && x!=z){
					if(x+y+z == a && x*y*z == b && x*x + y*y + z*z == c){
						if(x<ans[0]){
							ans[0] = x;
							ans[1] = y;
							ans[2] = z;
						}else if(x==ans[0]){
										if(y<ans[1]){
											ans[0] =x;
												ans[1] =y;
													ans[2] =z; 
							}
						}
							
					}
				}
			}
		}
	}

	if(ans[0]!=INF)
	printf("%d %d %d",ans[0],ans[1],ans[2]);
	else
	printf("No solution.");
}

int main(){

		int n,a,b,c;
		
		scanf("%d",&n);

		while(n){

			scanf("%d",&a);	scanf("%d",&b);	scanf("%d",&c);
			func(a,b,c);


					printf("\n");

			n--;
		}
}











