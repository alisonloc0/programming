#include <iostream>
#include <stdio.h>
 
 
using namespace std;
 
class Node{
 
    int v;
    Node * l;
    Node * r;
 
    public:
    Node(){}
    Node(int v_ , Node * l_ , Node * r_){
        v = v_;
        l = l_;
        r = r_;
    }
 
    int getV(){return v;}
    Node * getL(){return l;}
    Node * getR(){return r;}
    void setL(Node * l_){ l = l_;}
    void setR(Node * r_ ){ r = r_;}
};
 
 
Node * createNode(int v){
    Node * n = new Node(v,NULL,NULL);
    return n;
}
 
 
Node * raiz;
 
void insert(Node * n, int v){
 
    if( raiz == NULL){
 
     raiz = createNode(v);
     return;
    }
 
    if(v > n->getV()){
        if(n->getR() != NULL){
             insert(n->getR(),v);
        }else{
 
             n->setR(createNode(v));
        }
 
    }else if(v < n->getV()){
            if(n->getL() != NULL){
                insert(n->getL(), v);
            }else{
 
                n->setL(createNode(v));
            }
    }
 
 
}
 
 
void lrm(Node * n ){
    if( n != NULL){
 
        lrm(n->getL());
        lrm(n->getR());
        printf(" %d",n->getV());
    }
 
 
}
 
 
 
void lmr(Node * n ){
    if( n != NULL){
 
        lmr(n->getL());
                printf(" %d",n->getV());
        lmr(n->getR());
 
    }
 
 
}
 
 
void mlr(Node * n){
    if( n != NULL){
 
        printf(" %d",n->getV());
        mlr(n->getL());
        mlr(n->getR());
 
    }
}
 
int main()
{
 
    int n;
    scanf("%d",&n);
        for(int i = 0;i<n;i++){
                int k;
                scanf("%d",&k);
                    for(int j = 0 ; j < k ; j++){
                        int v; 
                        scanf("%d",&v);
                        insert(raiz,v);
                    }
                 printf("Case %d:\n",i+1);
                 printf("Pre.:");    mlr(raiz);  printf("\n");
                 printf("In..:");  lmr(raiz); printf("\n");
                 printf("Post:"); lrm(raiz); printf("\n");
 
                 printf("\n");
                 raiz = NULL;
 
 
        }
 
 
    return 0;
 
}
