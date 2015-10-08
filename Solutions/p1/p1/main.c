//
//  main.c
//  p1
//
//  Created by user on 09/05/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <alloca.h>


void mostra(int * aux);
void ler ( int * aux,int max);
int main(int argc, const char * argv[])
{
    int n = 3;
    int * v;
    

    v = (int *) malloc((n+1)*sizeof(int));
    
    
    ler(v,3);
    mostra(v);
}

void ler ( int * aux , int max)
{
    int i;
    for( i = 0; i<=max;i++)
    {
        scanf("%d",&aux[i]);
        if(i == max)
        aux[i] = '\0';
    }
    
}

void mostra(int * aux)
{
    
    while (*aux) {
        printf("%d \n",*aux);
        *aux = 10;
        aux++;
    }


}

