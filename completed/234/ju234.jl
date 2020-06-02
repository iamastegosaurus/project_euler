function get_primes(max_prime)
    primes = [2,3]
    for n::Int64 = 5:2:max_prime
        is_prime::Bool = true
        for p::Int64 in primes
            if n % p == 0
                is_prime = false
                break
            end
        end
        if is_prime == true
            append!(primes, n)
        end
    end
    n::Int64 = primes[length(primes)]
    while true
        n += 2
        is_prime = true
        for p in primes
            if n % p == 0
                is_prime = false
                break
            end
        end
        if is_prime == true
            append!(primes, n)
            return primes
        end
    end
end

function main()
    max_num = 999966663333
    max_prime = sqrt(max_num)
    p = get_primes(max_prime)

    sum::Int64 = 0

    for i::Int64 = 1:length(p) - 1
        lp::Int64 = p[i]
        up::Int64 = p[i+1]

        lps::Int64 = lp ^ 2
        ups::Int64 = up ^ 2

        for a::Int64 = lps+lp : lp : ups
            if a % up != 0 && a < max_num
                sum += a
            end
        end

        for b::Int64 = ups-up : -up : lps
            if b % lp != 0 && b < max_num
                sum += b
            end
        end
    end

    println(sum)
end

@time main() # 9 sec