import math


def approach1():
    for a in range(3, 500000):
        b = a + 1
        while True:
            c = math.sqrt(a**2 + b**2)
            if c % 1 == 0:
                L = a + b + c
                print(a, b, c)
                break
            else:
                b += 1
            
            if b > c:
                break


for L in range(12, 100):
    