function is_interesting(n::Int64)
    digit_sum::Int64 = sum( digits(n, base = 10) )
    if digit_sum < 2
        return false
    end
    while true
        if n == 1
            return true
        end
        if n % digit_sum == 0
            n::Float64 = n / digit_sum
        else
            return false
        end
    end
end

function check_nums(start::Int64, stop::Int64)
    for n::Int64 = start:stop
        if is_interesting(n)
            println(n)
        end
    end
end

function distribute(init::Int64, end_point::Int64)
    println("threadcount ", Threads.nthreads())
    batch_size::Int64 = 10000000
    batches = convert(Int64, floor( (end_point - init) / batch_size))
    if batches < 1
        batches = 1
    end
    @sync for i::Int64 = 1:batches
        start::Int64 = (i-1) * batch_size + init
        stop::Int64 = i * batch_size + init
        if start < 10
            start = 11
        end
        if stop > end_point
            stop = end_point
        end
        Threads.@spawn check_nums(start, stop)
    end
    check_nums(batches * batch_size, end_point)
end

@time distribute(12000000000, 13000000000)

# through 12,000,000,000

# 1 - 81
# 2 - 512
# 3 - 2401
# 4 - 4913
# 5 - 5832
# 6 - 17576
# 7 - 19683
# 8 - 234256
# 9 - 390625
# 10 - 614656
# 11 - 1679616
# 12 - 17210368
# 13 - 34012224
# 14 - 52521875
# 15 - 60466176
# 16 - 205962976
# 17 - 612220032
# 18 - 8303765625
# 19 - 10460353203

