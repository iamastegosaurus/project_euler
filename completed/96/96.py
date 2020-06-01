import numpy as np
import os

path = os.path.dirname(os.path.abspath(__file__))
datafile = open(path + '\\96_data.txt', 'r')

def possible(y,x,n):
    for i in range(9):
        if int(grid[y][i]) == n: # check row
            return False
    for i in range(9):
        if int(grid[i][x]) == n: # check column
            return False
    cornerX = (x//3)*3
    cornerY = (y//3)*3
    for j in range(3):
        for i in range(3):
            if int(grid[cornerY+j][cornerX+i]) == n: # check square
                return False
    return True

def solve():
    for y in range(9):
        for x in range(9):
            if int(grid[y][x]) == 0:
                for n in range(1, 10):
                    if possible(y,x,n):
                        grid[y][x] = n
                        solve()
                        grid[y][x] = 0
                return 

    corner = int( str(grid[0][0]) + str(grid[0][1]) + str(grid[0][2]) )
    ans_list.append(corner)

lines = datafile.readlines() 
grid = []
row_counter = 0
puzzleID = 1

ans_list = []

for line in lines: 
    if line[0] != "G":
        row = [int(i) for i in list(line.strip())]
        grid.append(row)
        row_counter += 1

    if row_counter == 9:
        solve()
        print("solved puzzle #" + str(puzzleID) + " out of 50")
        puzzleID += 1
        row_counter = 0
        grid = []

a = 0
for item in ans_list:
    a += item

print(a)