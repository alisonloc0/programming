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

using namespace std;

int num[10];
//colocar o zero na frente dos numeros menores

bool check(int n){
	if(n<=9999){
		if(num[0]==1)
		return false;
		num[0] = 1;
	}

	
	while(n){
			if(num[n%10] == 1)
				return false;
					else
					num[n%10] = 1;
	
	n = (int)floor(n/10);	

	}

	return true;
	
}
void func(int n ){
	int con = 0;

		for ( int b = 1234 ; b<= 98765 ; b++){
				memset(num,0,sizeof(num));
						if(check(b)==true && check(b*n)==true){
								printf("%0.5d / %0.5d = %d\n",b*n,b,n);
								
							con++;
						}
			
		}

	if(con == 0)
	printf("There are no solutions for %d.\n",n);


}

int main(){
	
	int N,first=1;
		while(true){
			scanf("%d",&N);
				if(N == 0){

					break;			
					
				}else{
					if(first){

						first = 0;
						
							}else
								printf("\n");
					
				}
	func(N);
	
	}
	

	return 0;

}








