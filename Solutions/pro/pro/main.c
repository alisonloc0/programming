/* Desenvolva um programa que preencha uma matriz (tipo int) com 10 x 10
 elementos utilizando valores aleatÛrios. Imprima  a matriz, a diagonal
 principal e os tri‚ngulos (superior e inferior).*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TAMANHO 10
#define TETO 8

int main( )
{
    int matriz[TAMANHO][TAMANHO];
    int i, j;
    
    srand (time(NULL));
    
    printf("A MATRIZ:\n\n");
    
    for(i = 0; i < TAMANHO; i++)
    {
        printf("\n");
        
        for(j=0; j < TAMANHO; j++)
        {
            matriz[i][j] = (rand() % (int)TETO) + 1;
            
            printf("[%d]", matriz[i][j]);
            
		}
		printf("\n");
    }
    
    printf("\n------------------------\n");
    printf("Diagonal Principal: \n");
    
    for(i = 0; i < TAMANHO; i++)
    {
        for(j=0; j < TAMANHO; j++)
        {
            if(i==j)
                printf("[%d] \t",matriz[i][j]);
            else
                printf("* \t");
        }
    }
    
    printf("\n------------------------\n");
    printf("Triangulo Superior: \n");
    
    for(i = 0; i < TAMANHO; i++)
    {
        for(j=0; j < TAMANHO; j++)
        {
            if(i<j)
            {
                printf("[%d][%d]\t", i,j);
            }
            else
                printf("* \t");
        }
    }
    
    printf("\n------------------------\n");
    printf("Triangulo Inferior: \n");
    
    for(i = 0; i < TAMANHO; i++)
    {
        for(j=0; j < TAMANHO; j++)
        {
            if(i>j)
            {
                printf("[%d]\t", matriz[i][j]);
            }
            else
                printf("* \t");
        }
    }
    
    printf("\n");

}
