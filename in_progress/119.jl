# 30 sec to find # 16 starting at # 15
function is_interesting_old(n::Int64)
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

# 37 sec to find # 16 starting at # 15
function is_interesting(n::Int64)
    sume::Int64 = sum( digits(n, base = 10) ) 
    p::Int64 = 0
    while true
        if sume < 2
            return false
        end
        numbre::Float64 = n / (sume ^ p)
        if numbre == 1
            return true
        end
        if numbre % sume != 0
            return false
        end
        p += 1
    end
end

function doo()
    count::Int64 = 0
    n::Int64 = 60466177
    while count < 1
        if is_interesting_old(n) == true
            count += 1
            println(count, "  ", n)
        end
        n += 1
    end
end

@time doo()

# is_interesting(29)

# 1  81
# 2  512
# 3  2401
# 4  4913
# 5  5832
# 6  17576
# 7  19683
# 8  234256
# 9  390625
# 10  614656
# 11  1679616
# 12  17210368
# 13  34012224
# 14  52521875
# 15  60466176
# 16  205962976
# 17  612220032