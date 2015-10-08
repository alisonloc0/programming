// @BEGIN_OF_SOURCE_CODE
#include <stdio.h>
#include <iostream>
#include <cstdio>
#include <vector>
#include <cmath>

using namespace std;

int func(int n1,int n2){

	int ret = 0;
	int carry = 0;
	int dig,n,con = 0;
	
	n = max(n1,n2);

	while(n>0){
		n/=10;

		
	if(n1%10 + n2%10 + carry >9){
	ret+=1;
	carry = 1;	
	}else{
	carry = 0;
	}

	n1 = (n1 - n1%10)/10;
	n2 = (n2 - n2%10)/10;
		
	}

	return ret;
}

int main(){

	int n1,n2;
	int ret;

	while(true){

		cin>>n1>>n2;

			if(n1 == 0 && n2 == 0)
			break;
	
	ret = func(n1,n2);

	if(ret == 0)
	printf("No carry operation.\n");
	else if (ret == 1)
		printf("%d carry operation.\n",ret);
		else
		printf("%d carry operations.\n",ret);
	
	}

	
	return 0;

}

// @END_OF_SOURCE_CODE
