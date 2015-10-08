#include <stdio.h>
#include <math.h>

#define MAXN 100100

int in(){ int x; scanf("%d",&x); return x;}

int v[MAXN];
int map[MAXN];

int main()
{
 freopen("i.in", "r", stdin);
    int t,first,last;
    
    t = in();

    int n =0;
    for (; n<t; n++)
    {
        first  = in();
        last = in();

        
        for( int i = 0 ; i<=last-first; i++)
        {
            map[i] = first + i;
            //printf("map[%d] = %d\n",i,map[i]);
        }
        
        int add = 0;
        if(first <4)
            add = 2;
        
        for( int j = 2 ; j<=sqrt(last)+1 ; j++)
        {
            for(int div = (first/j)+add ; div<=(last/j+2) && j<=div+2; div++ )
            {
                printf("multiplicando %d * %d = %d\n",j,div,j*div);
                    if(j*div>last || j*div<first)
                        continue;
                
                    int i_map = (j*div) - first;
                    map[i_map] = 0 ;
            }
           
            
            
        }
        
        int mp=0;
        for( int i = 0 ; i<=last-first; i++)
        {
                if(map[i]!=0 && map[i]!=1)
                {
              //  printf("%d\n",map[i]);
                    mp++;
                }
            
            

        }
        printf("%d",mp);
        if(!(n == t-1))
            printf("\n");

        
        
    }
    
    
    return 0;
}
