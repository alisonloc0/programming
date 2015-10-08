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
#include <algorithm>  
#define MAXN 10e8
#define INF -999999999
#define LL long long
#define PI pair<int,int>

using namespace std;
class QuadraticLaw{
public:
  set<LL>s;
  long long getTime(long long d){
    LL l = 0;
    LL h = sqrt(d);
    LL ans = 0;
    while(l<=h){
      LL m = (l+h)/2;
      if(m*m +m -d <= 0){
	ans = m;
	l = m+1;
      }else
	h = m-1;
    }
    return ans;
  }


};
int main(){

  QuadraticLaw * q = new QuadraticLaw();
 
  cout << q->getTime(1000000000000000000)<<endl;

  return 0;
}
