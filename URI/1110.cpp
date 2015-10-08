#include<iostream>
#include<deque>
#include <stdio.h>
 
using namespace std;
 
int main(){
 
 
    int n;
    cin>>n;
    while(n!=0){
    deque<char> a;
        for(int i=n;i>0;i--)
            a.push_front(i);
        if(n>1)
        cout <<"Discarded cards:";
            else
            cout <<"Discarded cards:"<<endl;
        while(a.size()>1){
 
            int out = a.front();
            a.pop_front();
 
            int back = a.front();
            a.push_back(back);
            a.pop_front();
 
                if(a.size()>1)
                cout<<" "<<out<<",";
                    else
                        cout<<" "<<out<<endl;
        }
     
        int last = a.front() ;
 
        cout<<"Remaining card: "<<last<<endl;
    cin>>n;
    }
 
    return 0;
     
}
