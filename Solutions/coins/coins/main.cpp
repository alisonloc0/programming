#include <algorithm>
#include <stdio.h>

#define MAXMOEDA 110
#define MAXVALOR 50010
#define INF 10000000

int moedas[MAXMOEDA];
int valorOtimo[MAXVALOR];


int in(){int x; scanf("%d",&x); return x;}

int func(int valor , int qtMoedas)
{
    memset(valorOtimo, 0, sizeof(valorOtimo));
    
    int min;
    valorOtimo[0] = 0;
    
    for(int i = 1 ; i<= valor ; i++)
    {
        min = INF;
        
        for(int k = 0 ; k < qtMoedas ; k++)
            {
                if(i>= moedas[k])
                {
                    if((1 + valorOtimo[ i - moedas[k] ]) < min)
                    {
                        min = 1 + valorOtimo [ i - moedas[k]];
                    }
                    
                }
            }
        
        valorOtimo [i] = min;

    }
    return valorOtimo[valor];
}

int main()
{

    freopen("i.in", "r", stdin);
    int qtMoedas;

    int valor = in();
    
    for (;valor!=0;) {
        
        qtMoedas = in();
        
        for(int i = 0 ; i<qtMoedas; i++)
            {
                moedas[i] = in();
            }
        
        int ret = func(valor, qtMoedas) ;

        if( ret == INF)
        printf("Impossivel\n");
        else
        printf("%d\n",func(valor,qtMoedas));
        
        valor = in();
    }
    
        
    
    return 0;
}

