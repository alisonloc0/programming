#include <stdio.h>

int main(){
    
    
    int n;
    int coord[1000][2];
    int k;
    int max;
    int instancia,con,j;
    float m,z;
    int x,y,xo,yo,xi,yi;
    int contador = 0;
    
    scanf("%d",&instancia);
    

    while(contador < instancia)
    {
        k = 0;
        max= 0;
    
    scanf("%d",&n);
    while(k < n)
    {
    scanf("%d",&coord[k][0]);
    scanf("%d",&coord[k][1]);
    k++;
    }
        
    int pi;
    for(pi = 0 ; pi<n-1;pi++)
    {
        
    for(k = pi; k<n-1 ; k++)
    {
        x = coord[k+1][0];
        y = coord[k+1][1];
        xo = coord[pi][0];
        yo = coord[pi][1];
        
        if(x - xo == 0)
        m = 0;
        else
        m = (y - yo)/(x-xo);
        con = 0;
        
        for( j = 0; j<n ; j++)
        {
            xi = coord[j][0];
            yi = coord[j][1];
            z = xi*m - xo*m + yo;
            if(z == yi)
            con++;
            
        }
        

        
        if(con>max)
        {
            max = con;
        }

        
    }

        
    }
    printf("%d\n",max);
    contador ++;
}

    
    return 0;
}