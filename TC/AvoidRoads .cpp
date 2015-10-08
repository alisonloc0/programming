#include <iostream>
#include <stdio.h>
#include <stack>
#include <deque>
#include <string>

#define MAXN 330

using namespace std;

void pilhain(stack<char> pos){
cout << " in ";
	while(!pos.empty()){
		cout<<pos.top()<<" ";
		pos.pop();
	}
	cout<<""<<endl;
}
void ppos(deque <char> pos){

	while(!pos.empty()){
		cout << pos.front();
		pos.pop_front();
	}
	cout<<endl;
}
int main(){

	int n;
	cin>>n;
	
	for(int i =0;i<n;i++){

		stack<char>in;
		deque<char>pos;

		string s;
		cin>>s;

    s.append(")");
    in.push('(');

    for(int i =0;i<s.length();i++){
    if(s[i] == '('){
        in.push(s[i]);
        }else
            if(s[i] == ')'){
                while(!in.empty() &&  in.top() != '('){    
                    char x = in.top();
                    in.pop();
                    pos.push_back(x);
                }
			      in.pop();
            }else
                if(s[i] == '+' || s[i] == '-'){
                    while(!in.empty() && in.top() != '('){
                        char x = in.top();
                        in.pop();
                        pos.push_back(x);
                    }
                in.push(s[i]);
                }else
                    if(s[i] == '*' || s[i]== '/'){
                        while((in.top() != '(' && in.top() != '+' && in.top() != '-')){
                        if(in.empty()) break;
                            char x = in.top();
                            in.pop();
                            pos.push_back(x);                            
                        }
                    in.push(s[i]);
                    }else if(s[i] == '^'){
											while((in.top() != '(' && in.top() != '+' && 
														in.top() != '-' && in.top() != '*' && 
														in.top() !=  '/')){
                        				if(in.empty()) break;
			                            char x = in.top();
      				                      in.pop();
      				                      pos.push_back(x);                            
                       			 }
                       			in.push(s[i]);
			                    }else{
      			                  pos.push_back(s[i]);
      				              }
    }

		ppos(pos);
	}	
    return 0;
}
