#include <stdio.h>
#include <iostream>
#include <algorithm>
#include <math.h>
 
using namespace std;
 
double func ( double h , double alpha, double v,double PI, double G){
 
    double s , vx , vy ,t ,delta;
    double x1,x2;
 
    vx = cos((alpha*PI)/180.0)*v;
    vy = sin((alpha*PI)/180.0)*v;
 
    t = (-vy-sqrt(pow(vy,2.0)-4.0*(-G/2.0)*h))/(2.0*(-G/2.0));
    s = vx*t;
    return s;
 
}
int main()
{
 
    double h ,alpha,v, ret;
    int p1, p2 , n;
    double PI =  3.14159;
    double G = 9.80665;
 
    while( scanf("%lf %d %d %d",&h,&p1,&p2,&n) != EOF){
 
        for ( int i = 0; i<n; i++){
        scanf("%lf %lf",&alpha,&v);
        ret = func(h,alpha,v,PI,G);
                if(ret >=p1 && ret<= p2)
                printf("%.5lf -> DUCK\n",ret);
                    else
                    printf("%.5f -> NUCK\n",ret);
        }
    }
 
    return 0;
}
