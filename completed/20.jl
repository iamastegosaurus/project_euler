function facto(n::BigInt)
    if n == 1
        return n
    else
        return n * facto(n-1)
    end
end

a = facto( convert(BigInt, 100) )
println(a)

x = digits(a, base = 10)
sume = sum(x)

println(sume)