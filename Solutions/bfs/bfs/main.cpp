#include <stdio.h>
#include <algorithm>
#include <queue>
#define MAXN 15

using namespace std;


int adj[MAXN][MAXN];
int grafo[MAXN];
queue<int> fila;


int bfs()
{
    int ret =1;
    int p;
    while (!fila.empty())
    {
        p = fila.front();
        printf("%d ",p);
        grafo[p] = 1;

            for( int w = 0 ; w < MAXN; w ++)    

		{
                if(adj[p][w] != 0 || adj[w][p] != 0 )
                {
                    if(grafo[w] == -1)
                    {
                        grafo[w] = -2;
                        fila.push(w);
                    }
                
                }
            }
        
        fila.pop();
    }
    
            printf("\n");
    return ret;
}

void printadj()
{

    
    for(int i = 0 ;i < MAXN; i ++)
    {
        for(int j = 0; j<MAXN ; j++ )
        {
            printf("%d ",adj[i][j]);
        }
        printf("\n");
    }

}

void printgrafo()
{
    
    for(int i = 0 ;i < MAXN; i ++)
    {
        
        printf("%d ",grafo[i]);
    }
    
        printf("\n");
}



int main(int argc, const char * argv[])
{
    
    int i,j;
    
    memset(adj, 0, sizeof(adj)); // 0 : nao existe ligacao
    memset(grafo, 0, sizeof(grafo));
    // 0 nao existe , -2  nao foi visitado , -1 adjacente ja visitado
    
    freopen("i.in", "r", stdin);
    
    int k;
    scanf("%d",&k);
    
    for (;k>0; k--) {

        scanf("%d %d",&i,&j);
        adj[i][j] = 1 ;
        adj[j][i] = 1;
        grafo[i] = -1;
        grafo[j] = -1;
        
    }


    for(int i = 0 ; i<MAXN ; i++)
    {
        if(grafo[i] == -1)
        {
            fila.push(i);
            break;
        }
    }
    bfs();
//    printf("%d",);
    
    
    return 0;
}

