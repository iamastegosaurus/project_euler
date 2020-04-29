# binomial theorem for deconstructing (a-1)^n + (a+1)^n )
# n will always be odd
# result of function mod a^2 will come to 2an
# max 2an mod a^2, or max 2n mod a

# if a is odd, n = (a-1) / 2, resulting in r = a(a - 1)
# if a is even, n = (a/2) - 1, resulting in r = a(a - 2)

function compute()
    r_sum = 0
    for a = 3:1000
        if a % 2 == 0
            r_sum += a*(a - 2)
        else
            r_sum += a*(a - 1)
        end
    end
    return r_sum
end

compute()