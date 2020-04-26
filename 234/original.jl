function get_upper_prime(n::Float32)
    stop::Bool = 0
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
            return n
        end
    end
end

function moo(num::Int64)
    lps::Int32 = 2
    ups::Int32 = 3
    semidivisible = []
    sum::Int128 = 0
    for n::Int64 = 5:num
        sq::Float32 = sqrt(n)
        if sq == ups
            lps = ups
            ups = get_upper_prime(sq)
            continue
        elseif sq > ups
            lps = ups
            ups = get_upper_prime(sq)
        end

        if (n % lps == 0) != (n % ups == 0)
            append!(semidivisible, n)
        end
        if n % 100000000 == 0
            println( round(n / num, digits=4) )
        end
    end
    for s in semidivisible
        sum += s
    end
    return semidivisible, length(semidivisible), sum
end

using Dates
target_num = 999966663333 # 999,966,663,333

@time moo(10000000000) 
#  1,000,000,000 6.8 sec
# 10,000,000,000 125 sec