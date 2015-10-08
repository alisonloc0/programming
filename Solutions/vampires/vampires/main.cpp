#include <stdio.h>
#include <iostream>
#include <algorithm>
#include <math.h>


using namespace std;

double func(int e1, int e2 , int at , int d ){
    
    double ret;
    
    double p ;
    double q ;
    
    double n1 = ceil (e1*1.0/d*1.0);
    double n2 = ceil (e2*1.0/d*1.0);
    
    if( at == 3 ){
        return (((n1)/(n1+n2))*1.0)*100;
    }else{
        p = (at*1.0/6*1.0);
        q = (1 - p)*(1.0);
        
        return (1 - pow((q/p),n1))/(1 - pow((q/p),n1+n2))*100;
    }
    
    
    return ret;
}

int main()
{
    int e1,e2,at,d;
    scanf("%d %d %d %d",&e1,&e2,&at,&d);
    
    while (e1 != 0 ) {
        printf("%.1f\n",func(e1, e2, at, d));
        scanf("%d %d %d %d",&e1,&e2,&at,&d);
        
    }
    
    return 0;
}

