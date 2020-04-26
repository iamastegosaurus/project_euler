function strip_excess_digits(n::Int128)
    str = string(n)
    len = length(str)
    if len > 10
        str = str[len-9:end]
    end
    return parse(Int64, str)
end

function split_pow()
    chunk_size = 5
    sum = 0
    for n = 1:1000
        splits = floor(n / chunk_size)
        mod = n % chunk_size
        result::Int128 = 1
        for t = 1:splits
            result *= n ^ chunk_size
            result = strip_excess_digits(result)
        end
        result *= n ^ mod
        result = strip_excess_digits(result)
        sum += result
    end
    ans = strip_excess_digits(sum)
    return ans
end

ans = split_pow()