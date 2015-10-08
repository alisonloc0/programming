#include <string.h>
#include <iostream>

#define MAXN 30
using namespace std;
    

char name[MAXN];
char rep_name[MAXN];

int  rep_p;

int main()
{

    int p = -1;
    int k,ins = 1;
    


    
while(scanf("%d",&k)!= EOF)
{

    for(int i = 0 ; i < k; i++)
    {
        
    cin>>name;
    cin>>p;
        
        if( i == 0 )
        {
            strcpy(rep_name,name);
            rep_p = p;
            continue;
        }
        
        if ( p == rep_p )
        {
            
            int j = 0;
            int i1,i2;
            
            while (name[j]!= '\0')
            {
            
                i1 = (int)rep_name[j];
                i2 = (int)name[j];

                    if(i2 != i1 )
                    {
                        if(i2 > i1)
                        {
                            strcpy(rep_name,name);
                            rep_p = p;

                        }
                    break;
                    }
            j++;
            }
            
            
            
        }else
            if( p < rep_p)
            {
                rep_p = p;
                strcpy(rep_name,name);
            }
        
        
    }
    printf("Instancia %d\n",ins);
    printf("%s",rep_name);
    printf("\n");
    ins++;
    
}
    
    return 0;
}

