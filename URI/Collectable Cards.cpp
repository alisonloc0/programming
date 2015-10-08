#include <stdlib.h>
#include <stdio.h>
 
int func(int x,int y)
{
    int m = x%y;
    if(m == 0){
        return y;
    }
     
    while(m != 0){
            x = y;
            y = m;
            m = x%y;
        }
        return y;
 
 
}
 
 
int main()
{
 
    int n,f1,f2;
    scanf("%d",&n);
     
    for(;n>0;n--){
         
        scanf("%d %d",&f1,&f2);
     
            if(f1>f2){
                printf("%d\n",func(f1,f2));
            }else{
                printf("%d\n",func(f2,f1));
            }
 
 
         
    }
     
}
