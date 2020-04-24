function remainder(a, n)
    x::Int128 = (a-1)^n + (a+1)^n
    y = a^2
    z = x % y
    print(x, " ", y, " ", z, "\n")
    return x, y, z
end

function compare_remainders()
    max_n = 20
    sum = 0
    for a = 999:999
        arr = 0
        for n = 1:max_n
            x, y, r = remainder(a, n)
            # print(n, " ", x, " ", y, " ", r, "\n")
            if r > arr
                arr = r
            end
        end
        sum += arr
    end
    return sum
end

compare_remainders()