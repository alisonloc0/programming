#include <iostream>
#include <cmath>
#include <stdio.h>
#include <iomanip>
#include <stack>
 
using namespace std;
 
void func(stack<int> a,stack<int> b,int n){
 
    while(!a.empty() ){
         
                if(!b.empty() && b.top() == n){
                    n--;
                    b.pop();
     
            }else{  
                b.push(a.top());
                a.pop();
            }
         
         
        }
        if(n == 0)
            printf("Yes\n");
            else
                printf("No\n");     
         
     
 
}
 
int main(){
 
 
    int n ;
    int f = 0;
    scanf("%d",&n);
     
    while( n != 0 ){
         
        stack<int> a,b;
        a.push(0);      
        int i = 0;
            while(i<n){
                        int k ;
                        scanf("%d",&k);
                        if(k == 0){
                            scanf("%d",&n);
                                if(n == 0 ){
                                    f = 1;
                                    break;
                                }else{
                                        i = -1;
                                        printf("\n");
                                }
                                 
                        }else
                            a.push(k);
                if(f == 1)
                break;
               i++;
                }
        if(f == 0)
        func(a,b,n);
        else
        printf("\n");
 
    }   
     
    return 0;
 
}
