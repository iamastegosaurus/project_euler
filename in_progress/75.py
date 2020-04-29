import math

triangles = []

for a1 in range(3, 20):
    for a2 in range(3, 20):
        h = math.sqrt(a1**2 + a2**2)
        if h % 1 == 0:
            L = a1 + a2 + h
            triangles.append( [a1, a2, h, L] )


print(triangles)