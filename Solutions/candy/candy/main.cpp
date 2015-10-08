#include <algorithm>
#include <stdio.h>
#include <math.h>
#define MAXN 500
#define INF 100000

int qt[MAXN]={1,2,3,1,1,1};
int cal[MAXN]={1,2,5,10,15,20};
int pd[MAXN];

int diff(int a, int b)
{
    int ret;
    ret = sqrt((a - b)*(a - b));
    
    return ret;
    
}


int func(int calorias , int qtCalorias )
{
    pd[0] = 0;
    
    memset(pd, INF, sizeof(pd));

    
    int dif = INF;
    int indK;
    int indJ;
    
    for(int c = cal[0] ; c<= calorias ; c ++)
        {
//            printf("CALORIAS = %d  ",c);
            for(int k = 0 ; k< qtCalorias; k ++)
                {

                        for(int j = 0 ; j<= qtCalorias ; j++)
                        {

                            if( cal[k] + cal[j] <=c)
                            {

                                int ret = diff(k + pd[c - cal[k]],j+pd[c-cal[k]]);
                                
                                printf(" cal[%d]+cal[%d] = %d ret = %d dif atual : %d \n ", k, j, cal[k] + cal[j],ret,dif);
                                
                                if ( ret < dif )
                                {
                                    if( qt[k] != 0 && qt[j] != 0)
                                    {
                                        dif = ret;
                                        indK = k;
                                        indJ = j;
                               
                                    }
                                }
                            

                            }
                        
                        }
                    
                }
            
            qt[indK] --;
            qt[indJ] --;
            pd[c]= dif;
            printf("pd[%d] = %d \n",c,pd[c]);
        }
    
    
    return cal[calorias];
    
}


int func2(int qtCalorias)
{
    
    for(int c = 1;c<=20;c++)
    {
        int dif = INF;
        int iI = INF;
        int iJ = INF;
        
        for(int i =0 ; i<qtCalorias;i++)
        {
            for( int j= 0; j<qtCalorias&& cal[j]>0 ; j++)
            {
                
                    if(cal[i]+cal[j] == c)
                    {
                        if(qt[i]>0 && qt[j] > 0)
                        {
                            if(i!=j)
                            {
                                int ret;
                                ret = diff(cal[i],cal[j]);
                        
                                if(ret < dif)
                                {
                                    dif = ret;
                                    iI = i;
                                    iJ = j;
                                }
                            }else
                            {
                                if(qt[i]>1)
                                {
                                    int ret;
                                    ret = diff(cal[i],cal[j]);
                                    
                                    if(ret < dif)
                                    {
                                        dif = ret;
                                        iI = i;
                                        iJ = j;
                                    }
                                }
                            }
                        }
                }
            }
        }
        
        if(iI != INF && iJ != INF)
        {
            qt[iI]--;
            qt[iJ]--;
                    printf("MIN DIF PARAR %d calorias foi usando cal[%d] e cal[%d] com DIF = %d \n",c,iI,iJ,dif);
        }
    }
    
    
    
        
    
 
    return 0;
}

int main()
{
    func2(6);
    
    return 0;
}

