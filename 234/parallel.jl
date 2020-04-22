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
            #println(n)
            #println(n, " ", lps, " ", sq, " ", ups)
        end
    
    end
    return sum
end

function distribute(num::Int64)
    # println(Threads.nthreads())
    moo::Int128 = 0
    sizzle::Int64 = 10000000
    n = convert(Int64, floor(num / sizzle))
    sum = zeros(n)
    @sync for i::Int64 = 1:n
        lower::Int64 = (i-1)*sizzle
        upper::Int64 = i*sizzle - 1
        if lower == 0
            lower = 5
        end
        Threads.@spawn sum[i] = get_semi( lower, upper )
        if i % 1000 == 0
            println("spawned process ", i, " of ", n + 1)
        end
    end
    for i = 1:n
        moo += sum[i]
    end
    println(moo, " ", n)
    moo += get_semi( n*sizzle, num )
    return moo
end

target_num = 999966663333 # 999,966,663,333
fraction = 1
num = convert(Int64, floor(fraction * target_num))

# @time distribute(num)

using Dates
start = Dates.Time(Dates.now())
ans = distribute(num)
println(ans)

# 48 - 30 = 18
# 34843 - 34825 = 18
# 2 + 4 + 5 + 7 = 18
finish = Dates.Time(Dates.now())

# spawned process 99000 of 99997
# 1259176438982923520 99996
# 1259187438574927249
# begin: 22:00:23.403
# end: 23:15:08.775

println("begin: ", start)
println("end: ", finish)

# 1259187438574927249
# 1259187438574927161

# println(1259187438574927249 - 1259187438574927161)

# a = get_semi(88, 88)
# println(a)

# begin: 10:18:29.106
# end: 12:31:38.717

# first attempt
# 1283880710526390539