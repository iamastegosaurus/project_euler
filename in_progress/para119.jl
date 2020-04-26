function is_interesting(n::Int64)
    sume::Int64 = sum( digits(n, base = 10) )
    pow::Int64 = 2
    interesting::Bool = false
    while true
        if sume < 2
            return false
        end
        if sume ^ pow == n
            return true
        elseif sume ^ pow > n
            return false
        end
        pow += 1
    end
end

function doo(start, stop)
    for n = start:stop
        if is_interesting(n) == true
            # return n
            println(n)
        end
    end
end

function distribute(init::Int64, num::Int64)
    sizzle::Int64 = 10000000
    n = convert(Int64, floor( (num - init) / sizzle))
    # nums = zeros(n)
    @sync for i::Int64 = 1:n
        start::Int64 = (i-1)*sizzle + init
        stop::Int64 = i*sizzle - 1 + init
        if start < 10
            start = 10
        end
        Threads.@spawn doo(start, stop)
    end
    # return nums
end


using Dates
start = Dates.Time(Dates.now())

distribute(612220033, 10000000000)

finish = Dates.Time(Dates.now())

println("begin: ", start)
println("end: ", finish)

# 81
# 52521875 
# 60466176 
# 34012224 
# 612220032
# 17210368
# 512
# 205962976
# 2401
# 4913
# 5832
# 17576
# 19683
# 234256
# 390625
# 614656
# 1679616
# 8303765625