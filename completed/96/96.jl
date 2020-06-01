function possible(x,y,n,grid)
    for i = 1:9
        if grid[y][i] == n
            return false
        end
    end
    for i = 1:9
        if grid[i][x] == n
            return false
        end
    end
    cx::Int16 = floor( (x-1) / 3) * 3
    cy::Int16 = floor( (y-1) / 3) * 3
    for j = 1:3
        for i = 1:3
            if grid[cy+j][cx+i] == n
                return false
            end
        end
    end
    return true
end

function solve(grid)
    for y = 1:9
        for x = 1:9
            if grid[y][x] == 0
                for n = 1:9
                    if possible(y,x,n,grid)
                        grid[y][x] = n
                        solve(grid)
                        grid[y][x] = 0
                    end
                end
                println(grid)
                return
            end
        end
    end
end


function run()
    grid = [[5,3,0,0,7,0,0,0,0],
            [6,0,0,1,9,5,0,0,0],
            [0,9,8,0,0,0,0,6,0],
            [8,0,0,0,6,0,0,0,3],
            [4,0,0,8,0,3,0,0,1],
            [7,0,0,0,2,0,0,0,6],
            [0,6,0,0,0,0,2,8,0],
            [0,0,0,4,1,9,0,0,5],
            [0,0,0,0,8,0,0,7,9]]

    solve(grid)

end


run()
