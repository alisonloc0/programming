#include <iostream>
#include <stdio.h>
#include <string>
#include <stack>
 
using namespace std;
 
int main(){
 
    
 
    int n; 
    scanf("%d",&n);
     
    for(int l=0;l<n;l++){
 
        string s; cin>> s;
         
            stack<char> a;
            int f = 0;
            int con = 0;
 
            for(int i =0; i<s.size();i++){
            if(s[i] == '<'){
                a.push(s[i]);
            }else if(s[i] == '>'){
                if(!a.empty() && a.top() == '<'){
                        a.pop();
                        con++;
                }
              }
    }
printf("%d\n",con);
}
 
    return 0;
 
}
