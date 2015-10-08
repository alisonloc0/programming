#include <stdio.h>
#include <iostream>
#include <algorithm>
#include <math.h>

// Formula de herão para area dados os 3 lados
// Relaçao entre triangulo inscrito na circunferencia : R = a*b*c / 4 * A(triangulo inscrito dentro)
// Relaçao entre circunferencia no triangulo : r = A(Triangulo)/p  onde p = (a+b+c)/2

using namespace std;

void func(int a, int b, int c){
    
    double p = (a+b+c)*1.0/2;
    
    double ATT = sqrt(p*((p-a)*(p-b)*(p-c)))*1.0;
    double ASC = M_PI * (ATT*1.0/p*1.0)*(ATT*1.0/p*1.0)*1.0;

    double r = ((a * b * c)*1.0)/(4*ATT);
    double ACT = M_PI * pow(r,2);
    
    double AC =  ACT - ATT;
    double AT =  ATT - ASC;
    
    printf("%.4lf %.4lf %.4lf\n",AC,AT,ASC);
    

    
}

int main()
{
    int a,b,c;
    
    while(scanf("%d %d %d",&a,&b,&c)!= EOF){
        func(a,b,c);
        
    }
    
    
    return 0;
}

