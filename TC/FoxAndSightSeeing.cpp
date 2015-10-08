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
using namespace std;

class FoxAndSightseeing{
    
public:
	int getMin(vector<int> position){
        int econ = -10000000;
        int idx = -1;
        
		for(int i =1;i<position.size()-1;i++){
			int d = abs(position[i-1] - position[i]) + abs(position[i] - position[i+1]) - (abs(position[i-1] -position[i+1]));
            if( d > econ){
                econ = d;
                idx = i;
			}
		}
		int sum = 0;
		for(int i = 0; i<position.size()-1;i++){
            sum+= abs(position[i]-position[i+1]);
		}
        
		sum-= abs(position[idx-1]-position[idx]);
		sum-= abs(position[idx]-position[idx+1]);
		sum+= abs(position[idx-1]-position[idx+1]);
		return sum;
		
	}
    
};

int main(){
vector<int> n;
n.push_back(-2);
n.push_back(4);
n.push_back(3);

FoxAndSightseeing * f = new FoxAndSightseeing();
cout << f->getMin(n);

return 0;
}

