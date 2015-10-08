#include <stdio.h>
#include <stdlib.h>
#include <math.h>

const double EPS = 0.00000001;

int cmp (double a, double b) {
    return fabs(a - b) <= EPS;
}

int main(void) {

    int n;
    double coord[1000][2];
    int k;
    int maxCon,ri;
    int instancia,con;
    int contador = 0;
    scanf("%d",&instancia);
    
    while(contador < instancia) {
        k = 0;
        maxCon = 1;
        
        scanf("%d",&n);
        //if (contador == 82) printf("%d\n", n);
        while(k < n) {
            scanf("%lf %lf",&coord[k][0],&coord[k][1]);
            if (contador == 82) {
                printf("entradA \n");
                printf("%f %f\n", coord[k][0], coord[k][1]);
                printf("fim entradA\n");
            }
            k++;
        }
        
        
        double m, m2;
        
        for(ri = 0 ; ri<n-1 ; ri++) {
            if (coord[ri+1][0]-coord[ri][0] == 0) {
                m = 0;
            } else {
                m = (coord[ri+1][1] - coord[ri][1])/(coord[ri+1][0]- coord[ri][0]);
            }
            
            con = 2;
            
            for(k = 0; k<n ; k++) {
                if (k == ri || k == ri + 1) continue;
                if (coord[k][0]-coord[ri][0] == 0) {
                    m2= 0;
                } else {
                    m2 = (coord[k][1] - coord[ri][1])/(coord[k][0] - coord[ri][0]);
                }
                
                if (cmp(m, m2)) {
                    con++;
                    if(contador == 82)
                    {
                        printf("\n m = %f e m2 = %f \n",m,m2);
                    }
                }
            }
            if(con>maxCon) {
                maxCon = con;
            }
        }
        printf("%d\n",maxCon);
        contador ++;
    }
    return 0;
}
