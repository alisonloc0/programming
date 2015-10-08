// @BEGIN_OF_SOURCE_CODE
#include <stdio.h>
#include <iostream>
#include <cstdio>
#include <vector>
#include <cmath>

using namespace std;
 
class Segment {
    
public:
   vector<int> A, tree;
 
   Segment(vector<int> &_A) : A(_A) {
      int N = A.size();
      tree = vector<int>(4 * N,1);
      build(1, 0, N - 1);
   }
 
   void build(int node, int a, int b) {
      if(a == b) {
         tree[node] = A[a];
         return;
      }
       
      int m = (a+b)/2;
       
      build(2*node, a, m);
      build(2*node + 1, m+1, b);
       
      tree[node] = tree[2*node] * tree[2*node+1];
   }


	int query(int i, int j){
	
	int n = A.size()-1;
	int ret = _query(1,0,n,i,j);

	return ret;

	}

	int _query(int node , int a,int b , int i , int j){


		if(b<i || a>j)
		return 1;

		if(a>=i && b<=j)
		return tree[node];

		int m = (a+b)/2;
		
		return ( _query(2*node,a,m,i,j) * _query(2*node +1,m+1,b,i,j));
		
	}

	void update(int idx , int v){

	int n = A.size() - 1;
	return _update(1,0,n,idx,v);
	
	}

	void _update(int node , int a , int b , int idx , int v){

		if(idx < a || idx > b)
		return;
		
		if(a == idx && b == idx){
		tree[node] = v;  
		return;
		}

		int m = (a+b)/2;
		_update(2*node,a,m,idx,v);
		_update(2*node +1,m+1,b,idx,v);		

		tree[node] = tree[node*2] * tree[node*2 +1];
	}

	void p_tree(){

	int n = tree.size();
	
	for(int i = 0 ; i<n; i++){
	printf("%d ",tree[i]);
	}
}

};

vector<int> list;

int main(){

	
	int n,q,x,idx,v,k,f,ret;
	char stm;
	
	while(cin>>n>>q){
	list.clear();

		for(int i = 0; i<n ; i++){
		cin >> x;
			if(x>0)
				x = 1;
				else if (x <0)
					x = -1;
					else
					x= 0 ;
			
		list.push_back(x);
		}

		Segment s(list);

		for(int i = 0 ;i<q; i++){

			cin >>stm;
			
			if(stm == 'P'){
			cin >> k >>f;
			k--;
			f--;
			ret = s.query(k,f);
				if(ret >0)	
					printf("+");
						else if(ret<0)
						printf("-");
							else
							printf("0");
		
			}else if (stm == 'C'){
			cin>> idx >> v;
				if(v>0)
				v = 1;
					else if (v <0)
					v = -1;
						else
						v= 0 ;

			s.update(idx-1,v);
			}
		
		}
	printf("\n");
	
	}
	
	

return 0;
}
// @END_OF_SOURCE_CODE

