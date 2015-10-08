#include <stdlib.h>
#include <algorithm>

using namespace std;

int p[] = {2,3,5,10};
int v[] = {10,5,2,12};
int pd[5][20];


int func(int n , int c)
{

    // MatrixMV = Qt_Objeto X Capacidade_total 
    for(int i = 1 ; i <n ; i++)
    {
        for( int j = 0 ; j<=c; j++)
        {
            if( v[j] > j)
            {
                pd[i][j] = pd[i-1][j];
            }else
                {
                pd[i][j] = max(pd[i-1][j],pd[i-1][j-v[i]]);
                }
            
        }
    }

    return pd[n][c];
}

int main()
{
    int n = 4;
    int c = 20;

    memset(pd, 0, sizeof(pd));
    
    func(n,c);
    
    
    return 0;
}

