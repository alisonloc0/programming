#include <iostream>
#include <cmath>
#include <stdio.h>
#include <iomanip>
 
using namespace std;
 
 
 
int main(){
     
    double l,w;
    double _max,_min,x0,x1;
 
     
    while( scanf("%lf %lf",&l,&w) == 2){
 
    _max = (double)(-((-4.0)*(l+w)) - sqrt((pow(((-4.0)*(l+w)),2.0)- (4.0*12.0*l*w))))/(double)(2.0*12.0);
    _min = (double)(-((-4.0)*(l+w)) + sqrt((pow(((-4.0)*(l+w)),2.0)- (4.0*12.0*l*w))))/(double)(2.0*12.0);  
 
    x0 = (double)(-((-2.0) * (l+w)) - sqrt((pow(((-2.0) * (l+w)),2.0)- (4.0*4.0*l*w))))/(double)(2.0*4.0);
    x1 = (double)(-((-2.0) * (l+w)) + sqrt((pow(((-2.0) * (l+w)),2.0)- (4.0*4.0*l*w))))/(double)(2.0*4.0);  
     
    if(_min > x0 && _min < x1 )
        _min = x0;
 
    _min+= 10e-7;   
    printf("%.3lf 0.000 %.3lf\n",_max,_min);
 
    }
     
     
    return 0;
 
}
