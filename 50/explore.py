# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most consecutive primes?

primes = [2, 3]

def get_primes(num):

    for n in range(5, num):
        prime = True
        for p in primes:
            if n % p == 0:
                prime = False
        if prime == True:
            primes.append(n)

        if n % 1000 == 0:
            print(n / num)

    
get_primes(1000000)

check_list = primes[-10:]

ultra_pp = 0
pp_count = 0

for pp in reversed(check_list):

    for q in range(len(primes)):
        s = 0
        count = 0
        for p in primes[q:]:
            s += p
            count += 1

            if s > pp:
                break
            elif s == pp:
                if count > pp_count:
                    pp_count = count
                    ultra_pp = pp
print(ultra_pp, pp_count)
