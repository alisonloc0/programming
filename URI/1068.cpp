#include <iostream>
#include <stdio.h>
#include <string>
#include <stack>
 
using namespace std;
 
int main(){
 
    string s;
 
 
    while( cin>> s){
    int f = 0;
    stack<char> a;
 
            for(int i =0; i<s.size();i++){
            if(s[i] == '('){
                a.push(s[i]);
            }else if(s[i] == ')'){
                if(!a.empty() && a.top() == '(')
                        a.pop();
                        else{
                            f = 1;
                            break;
                        }
 
 
            }
    }
    if(a.empty() && f == 0)
        printf("correct\n");
            else
                printf("incorrect\n");
 
    }
 
    return 0;
}
