#include <iostream>
#include <vector>
#include <cmath>

// executes in ~15 seconds

std::vector<int> getPrimes(int maxPrime) {
    std::vector<int> p = {2, 3};
    bool isPrime;
    int biggestPrime;
    for (int i = 5; i < maxPrime; i+=2 ) {
        isPrime = true;
        for (int j = 0; j < p.size(); j++) {
            if (i % p[j] == 0) {
                isPrime = false;
                break;
            }
        }
        if (isPrime == true) {
            p.push_back(i);
            biggestPrime = i;
        }
    }
    while (true) {
        biggestPrime += 2;
        isPrime = true;
        for (int j = 0; j < p.size(); j++) {
            if (biggestPrime % p[j] == 0) {
                isPrime = false;
                continue;
            }
        }
        if (isPrime == true) {
            p.push_back(biggestPrime);
            break;
        }
    }
    return p;
}

int main() {

    long long targetNum = 999966663333; 
    int maxPrime = sqrt(targetNum) + 1;
    long long sum = 0;

    std::vector<int> primes = getPrimes(maxPrime);
    std::cout << "primes finished" << std::endl;

    for (int i = 0; i < primes.size() - 1; i++) {
        int lp = primes[i];
        int up = primes[i+1];

        long long lps = pow(lp, 2);
        long long ups = pow(up, 2);

        for (long long a1 = lps + lp; a1 < ups; a1 += lp) {
            if (a1 % up != 0 && a1 < targetNum) {
                sum += a1;
            } 
        }

        for (long long a2 = ups - up; a2 > lps; a2 -= up) {
            if (a2 % lp != 0 && a2 < targetNum) {
                sum += a2;
            }
        }
    }
 
    std::cout << sum << std::endl;
    return 0;
}