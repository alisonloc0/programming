#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <algorithm>

using namespace std;

int func(int k ){

    int n = 0;
    
    while(!( k == 1 )){
     
        
        n++;
        if(k%2 == 0){
            k/=2;
        }else{
            k = 3*k + 1;
        }

    }
        n++;
        return n;
   
    }


int main()
{

    int i ,j , m ,n;
    
    while(scanf("%d %d",&i,&j)!= EOF){
        int n1 = i;
        int n2 = j;
        
        m = 0;
        n = 0;

        if( i > j)
            swap(i, j);
            
        for(int k = i ; k<=j;k++ ){
            n = func(k);
            if (m <= n ) {
                m = n;
            }
        }
        
        printf("%d %d %d\n",n1,n2,m);
        
    }
    
    return 0;
}


