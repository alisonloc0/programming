#include <iostream>
#include <cmath>
#include <stdio.h>
#include <iomanip>
 
using namespace std;
 
long long con;
 
long long func(long long n){
    con++;
        if(n == 1)
            return 1;
            else if(n == 0)
                return 0;
                    else
                    return func(n-1)+func(n-2);
 
}
 
int main(){
 
 
 
    long long i;
    int n ;
 
    scanf("%d",&n);
    for(int k = 0;k<n;k++){
        scanf("%lld",&i);
            con = 0;
                long long ret = func(i);
                    printf("fib(%lld) = %lld calls = %lld\n",i,con-1,ret);
    }
     
     
 
 
    return 0;
 
}
