#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

using namespace std;

int josephus(int n, int k){

    
    int p = 0;
    int i = 1;
    
    while (i <= n){
        printf("%d ",p);
        p = (p + k) % n;
        i+= 1;


    }
    return p+1;
    
}


int main()
{
    
    printf("",josephus(5,3));
    
    return 0;
}

