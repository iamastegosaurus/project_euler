import math

def bruteforce(n):
    d = 0
    for i in range(1, int(math.sqrt(n+1))):
        if n % i == 0:
            d += 2
    return d

d = 0
tri_index = 0
tri = 0

while d < 500:

    tri_index += 1
    tri += tri_index
    d = bruteforce(tri)

print(tri_index, tri, d)
