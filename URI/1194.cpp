#include <iostream>
#include <stdio.h>
 
 
using namespace std;
 
class Node{
 
    int v;
    char c; 
     
    Node * l;
    Node * r;
 
    public:
    Node(){}
    Node(int v_ , Node * l_ , Node * r_,char c_){
        v = v_;
        l = l_;
        r = r_;
        c = c_;
    }
 
    int getV(){return v;}
     char getC(){return c;}
    Node * getL(){return l;}
    Node * getR(){return r;}
     
    void setL(Node * l_){ l = l_;}
    void setR(Node * r_ ){ r = r_;}
    void setC(char c_){c = c_;}
};
 
 
Node * createNode(int v , char c){
    Node * n = new Node(v,NULL,NULL,c);
    return n;
}
 
 
Node * raiz;
 
void insert(Node * n, int v,char c){
 
    if( raiz == NULL){
 
     raiz = createNode(v,c);
     return;
    }
 
    if(v > n->getV()){
        if(n->getR() != NULL){
             insert(n->getR(),v,c);
        }else{
 
             n->setR(createNode(v,c));
        }
 
    }else if(v < n->getV()){
            if(n->getL() != NULL){
                insert(n->getL(), v,c);
            }else{
 
                n->setL(createNode(v,c));
            }
    }
 
 
}
 
 
 
// EM ERD
// PRE RED
// POS EDR
 
void lrm(Node * n ){
    if( n != NULL){
 
        lrm(n->getL());
        lrm(n->getR());
        printf("%c",n->getC());
 
    }
 
 
}
 
int main()
{
 
     
    int n;
    scanf("%d",&n);
 
    for(int i=0;i<n;i++){
 
        int nodes;
        string s1;
        string s2;
         
        cin>> nodes >> s1 >> s2;
         
            for(int i = 0; i <nodes ; i++){
                for(int j =0;j<nodes ; j++){
                    if( s1[i] == s2[j])             
                        insert(raiz,j,s1[i]);
                    }
                }   
 
            lrm(raiz);printf("\n");
            raiz = NULL;        
    }
     
    return 0;
 
}
