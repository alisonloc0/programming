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

INT func(INT L,INT P,INT V){

	INT days = 0LL;

	INT d1 = (INT) floor(V/P) * L;
	INT d2 = (INT)V%P;
	if(d2 > L)
	days = d1 + L;
	else
	days = d1 + d2;
	
	return days;
}

int main(){


	INT L,P,V,CON = 0LL;
	L = 1LL;
	
	while(scanf("%lld %lld %lld",&L,&P,&V)){
	
		if(L!=0){
		CON++;
		printf("Case %lld: %lld\n",CON,func(L,P,V));
		}else
		break;

	}
	

	return 0;






}
