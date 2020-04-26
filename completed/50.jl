function get_primes(num::Int32)
    primes = [2, 3, 5]
    for n::Int32 = 5:2:num
        isPrime::Bool = true
        for p::Int32 in primes
            if n % p == 0
                isPrime = false
                break
            end
        end
        if isPrime == true
            append!(primes, n)
        end
    end
    return primes
end


function go()
    num::Int32 = 1000000
    primes = get_primes(num) # 78,498 primes below 1,000,000
    targets = primes[end:-1:77000] # only checking the first few thousand

    println(size(primes))
    println("finished primes") 
    # println(targets)

    biggest_num::Int32 = 0
    longest_count::Int32 = 0

    for target::Int32 in targets
        for q::Int32 = 1:100
            count::Int32 = 0
            sum::Int32 = 0
            for p::Int32 in primes[q:end]
                sum += p
                count += 1
                if sum > target
                    count = 0
                    break
                elseif sum == target
                    # println("match ", target, " ", count)
                    if count > longest_count
                        longest_count = count
                        biggest_num = target
                    end
                end

            end
        end
    end
    println(biggest_num)
    println(longest_count)
end

@time go()
