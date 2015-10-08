#include <iostream>
#include <cmath>
#include <stdio.h>
#include <vector>
#include <string>
#include <sstream>
#include <stack>
#include <queue>
 
#define INF -100000.0
#define MAXN 30
  
using namespace std;
  
int main(){
  
  
    int n = -1;
    cin>>n;
 
    while(n !=0){
  
  
        vector<char>v;
         queue<char>in;
        stack<char>b;
          
        for(int i =0;i<n;i++){
            char k;
                    cin>>k;
                    in.push(k);
        }
  
        in.push('0');
  
        for(int i =0;i<n;i++){
            char k;
                    cin>>k;
                    v.push_back(k);
        }  
  
        int p = 0;
      
        while(!in.empty() ){
                if(!b.empty() && b.top() == v[p]){
                    cout<<"R";
                    p++;
                    b.pop();
                }
                else{
                    if(in.front() == '0')
                        break;
                        b.push(in.front());
                        in.pop();
                        cout<<"I";
                }
        }
        if(p != n)
            cout<<" Impossible"<<endl;
            else
            cout<<endl;
  
        cin>>n;
    }
  
  
    return 0;
  
}
