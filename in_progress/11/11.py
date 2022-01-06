import numpy as np

readfile = open("grid.txt", "r").read()

grid = np.zeros(shape = [20, 20], dtype = np.int32)




for n in range(len(readfile)):
    if readfile[n] == ' ':
        d1 = readfile[n+1]



