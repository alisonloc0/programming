#include <stdio.h>
#include <stdlib.h>
int main(){

    int n;
    int coord[1000][2];
    int k;
    int maxCon,ri;
    int instancia,con;
    int contador = 0;

    scanf("%d",&instancia);

    while(contador < instancia)
    {
        k = 0;
        maxCon= 0;

    scanf("%d",&n);
    while(k < n)
    {
    scanf("%d",&coord[k][0]);
    scanf("%d",&coord[k][1]);
    k++;
    }

    for(ri = 0 ; ri<n-1 ; ri++)
    {
    float m = 0;
    con = 0;
    for(k = (ri+1) ; k<n ; k++)
        {
        if(m == 0 )
        {
        m = (coord[k][1] - coord[ri][1])/(coord[k][0]-coord[ri][0]);

        printf("\nvalor de (%d - %d )/(%d - %d )   m = %d\n",coord[k][1],coord[ri][1],coord[k][0],coord[ri][0],m);
        con++;
        }else{
        printf("\nvalor de (%d - %d )/(%d - %d )  m 2= %d\n",coord[k][1],coord[ri][1],coord[k][0],coord[ri][0],(coord[k][1] - coord[ri][1])/(coord[k][0] - coord[ri][0]));
        if( m == (coord[k][1] - coord[ri][1])/(coord[k][0] - coord[ri][0]))
                con++;
                }

        }
        if(con>maxCon)
        maxCon = con;
    }
    printf("%d\n",maxCon);
    contador ++;


    } // fim instancia



    return 0;

}
