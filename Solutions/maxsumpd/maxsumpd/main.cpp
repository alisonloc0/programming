#include <stdio.h>
#include <string.h>
#define MAXN 100100

int v[MAXN],f[MAXN],pd[MAXN];
int in(){int x; scanf("%d",&x); return x;}

int maxsumsb(int p ,int r )
{
    f[p] = v[p];

    for( int q = p +1 ; q <= r; q++)
    {
        if(f[q-1]> 0 )
        {
            f[q] = f[q-1]+v[q];
            
        }else
            {
            f[q] = v[q];
            }
 

    }
    
    int ret = f[p];
    for( int i = p+1  ; i <= r; i++)
    {
        if(f[i]>ret)
            ret = f[i];
    }

    return ret;
}

int main()
{

    //freopen("i.in", "r", stdin);

    int n,t;
    n = in();
    
    for(; n>0 ;n--)
    {
        memset(pd, -1, sizeof(pd));
        t = in();
        
        for(int k=1 ; k<=t; k++ )
        {
            v[k] = in();
        }
        
    }
    int ret  = maxsumsb(1,t);
    printf("%d",ret);
    
    return 0;
}

