function check_nums()
    max_val = 10000000000000000
    nums = []
    for n = 2:100
        for p = 2:30
            if n^p > max_val
                break
            end
            if sum( digits(n ^ p, base = 10) ) == n
                append!(nums, n^p)
            end
        end
    end
    println(sort(nums)[30])
end

check_nums() # 248155780267521