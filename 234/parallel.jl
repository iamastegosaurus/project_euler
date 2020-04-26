function get_upper_prime(n::Float64)
    stop::Bool = 0
    n = floor(n)
    while stop == 0
        n += 1
        prime::Bool = true
        if n % 2 == 0
            prime = false
            continue
        end
        for t::Int64 = 3:2:n-1
            if n % t == 0
                prime = false
                continue
            end
        end
        if prime == true
            return convert(Int64, n)
        end
    end
end

function get_lower_prime(n::Float64)
    if n <= 3
        return 2
    end
    if n > floor(n)
        n = floor(n) + 1
    end
    stop::Bool = 0
    while stop == 0
        n -= 1
        prime::Bool = true
        if n % 2 == 0
            prime = false
            continue
        end
        for t::Int64 = 3:2:n-1
            if n % t == 0
                prime = false
                continue
            end
        end
        if prime == true
            return convert(Int64, n)
        end
    end
end

function get_semi(lb::Int64, ub::Int64)
    lps::Int64 = get_lower_prime( sqrt(lb) )
    ups::Int64 = get_upper_prime( sqrt(lb) )
    sum::Int128 = 0
    count::Int64 = 0
    for n::Int64 = lb:ub
        sq::Float64 = sqrt(n)
        if sq == ups
            lps = ups
            ups = get_upper_prime(sq)
            continue
        elseif sq > ups
            lps = ups
            ups = get_upper_prime(sq)
        end
        if (n % lps == 0) != (n % ups == 0)
            sum += n
            count += 1
        end
    end
    return count, sum
end

function distribute(num::Int64)
    println("threadcount ", Threads.nthreads())

    final_sum::Int128 = 0
    count::Int64 = 0
    batch_size::Int64 = 100000000

    n = convert(Int64, floor(num / batch_size))
    if n < 1
        n = 1
    end
    storage = []

    @sync for i::Int64 = 1:n
        lower::Int64 = (i-1)*batch_size
        upper::Int64 = i*batch_size - 1
        if upper > num
            upper = num
        end
        if lower == 0
            lower = 5
        end
        Threads.@spawn append!(storage, get_semi( lower, upper ))
        println( round(i / (n+1), digits=4) )

    end

    append!(storage, get_semi( n*batch_size, num ))

    for s = 1:convert(Int64, size(storage, 1))
        if s % 2 == 0
            final_sum += storage[s]
        else
            count += storage[s]
        end
    end
    return count, final_sum
end

target_num = 999966663333 # 999,966,663,333

@time distribute(target_num)

# 4121.928140 seconds (451.51 k allocations: 21.604 MiB) - 1 hour 9 min
# (3764437, 1259187438574927161)