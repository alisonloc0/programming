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
 
 
 
int func(int a, int b){
 
    if(b == 0 )
        return a;
        else
            return func(b,a%b);
 
}
int main(){
 
    int n,a,b;
    cin>>n;
    for(int i= 0;i<n;i++){
            cin>>a>>b;
            cout<<func(a,b)<<endl;
            }
                 
         
return 0;
     
     
}
