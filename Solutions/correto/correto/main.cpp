// PRIME1 - C++ (g++)
// AC Time: 2.52s
// NOTE: I am aware that the use of vector and set actually
//  makes this code run _slower_
// I used vector and set simply as a way of practicing STL
#include <iostream>
#include <cmath>
#include <vector>
#include <set>
using namespace std;

int main() {
    freopen("i.in", "r", stdin);
    vector<int> primes;
    primes.push_back(2);
    
    for (int i = 3; i <= 32000; i+=2) {
        bool isprime = true;
        int cap = sqrt(i) + 1;
        
        vector<int>::iterator p;
        for (p = primes.begin(); p != primes.end(); p++) {
            if (*p >= cap) break;
            if (i % *p == 0) {
                isprime = false;
                break;
            }
        }
        if (isprime) primes.push_back(i);
    }
    
    int T,N,M;
    
    cin >> T;
    
    for (int t = 0; t < T; t++) {
        if (t) cout << endl;
        
        cin >> M >> N;
        if (M < 2) M = 2;
        
        int cap = sqrt(N) + 1;
        
        set<int> notprime;
        notprime.clear();
        
        vector<int>::iterator p;
        for (p = primes.begin(); p != primes.end(); p++) {
            
            if (*p >= cap) break;
            int start;
            
            if (*p >= M) start = (*p)*2;
            else start = M + ((*p - M % *p) % *p);
            
            for (int j = start; j <= N; j += *p) {
                notprime.insert(j);
            }
        }
        
        int mp= 0;
        
        for (int i = M; i <= N; i++) {
            if (notprime.count(i) == 0) {
                //cout << i << endl;
                mp++;
            }
        }

        printf("%d\n",mp);
    }
    return 0;
}