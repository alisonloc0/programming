#include <iostream>
#include <stdio.h>
#include <string>
#include <stack>
#include <Math.h>
#include <sstream>
#include <vector>

using namespace std;

class SalaryCalculator{
		public:

		double calcHours(int P1, int P2, int salary){

				if( 200 * P1 < salary ){
						salary-= (200*P1*1.0);
						double newHs = (salary*(1.0))/(P2*(1.0));
								return (200 + newHs);			
				}
					else{
					return (salary*(1.0))/(P1*(1.0));
					}
					
						
		}

			

}; 


int main(){

				SalaryCalculator * s = new SalaryCalculator();
				cout << 	s->calcHours(10,15,3000) <<endl;
				
        return 0;
 
}
