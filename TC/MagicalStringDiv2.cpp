#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <set>
#include <map>
#include <list>
#include <queue>
#include <stack>
#include <memory>
#include <iomanip>
#include <numeric>
#include <functional>
#include <new>
#include <algorithm>
#include <cmath>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <climits>
#include <cctype>
#include <ctime>

using namespace std;

class MagicalStringDiv2{

	public:
	int minimalMoves(string s){
	int count = 0;
	for(int i = 0; i<s.size(); i++){
			if(s[i] != '>' && i<s.size()/2)
				count++;			
			if(s[i] != '<' && i>=s.size()/2)
				count++;
	}
	
	return count;
		
	}
	

};
