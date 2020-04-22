function num_div(n)
    div = 0
    for t = 1:n
        if n % t == 0
            div += 1
        end
    end
    return div
end


a = num_div(120)
println(a)