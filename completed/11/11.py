import numpy as np

with open('11.txt.') as f:
    data = f.readlines()

grid = np.loadtxt(data, dtype=np.int64)
ans = 0

for j in range(20):
    for i in range(20):
        if i < 17:
            tmp = grid[j, i] * grid[j, i+1] * grid[j, i+2] * grid[j, i+3]
            if tmp > ans:
                ans = tmp
        if j < 17:
            tmp = grid[j, i] * grid[j+1, i] * grid[j+2, i] * grid[j+3, i]
            if tmp > ans:
                ans = tmp
        if i < 17 and j < 17:
            tmp = grid[j, i] * grid[j+1, i+1] * grid[j+2, i+2] * grid[j+3, i+3]
            if tmp > ans:
                ans = tmp
        if i > 2 and j < 17:
            tmp = grid[j, i] * grid[j+1, i-1] * grid[j+2, i-2] * grid[j+3, i-3]
            if tmp > ans:
                ans = tmp

print(ans)