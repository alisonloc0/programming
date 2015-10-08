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

#define MAXN	16
#define INF 1000000

using namespace std;

class ColorfulRoad{
int size;
int pd[MAXN];
string street;

		public:
		int getMin(string road){
	
			
			size = road.length();
			street = road;

			for(int i = 0;i<size;i++)
			pd[i] = INF;
			int ret = func('R',0);
				if(ret == INF)
					return -1;
						else
							return ret;
		}

int func(char cor , int n){
		if(n == size -1)
			return 0;
			
				if ( cor == 'R') cor = 'G';
					else if ( cor == 'G') cor = 'B';
								else if( cor == 'B') cor = 'R';

	if(pd[n] == INF) {
		int m = INF;
			for(int i = n+1; i<size;i++){
				if (street[i] == cor) {
					m = min(m,(i-n)*(i-n) + func(cor,i));								
					}
			}
			pd[n] = m;
	}
				
			return pd[n];
}

};




int main(){
		ColorfulRoad * c = new ColorfulRoad();
		cout << 	c->getMin("RBRGBGBGGBGRGGG") << endl;

	
		return 0;

		

}



