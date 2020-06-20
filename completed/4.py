def is_palandrome(n):
    checks = len(n) // 2
    for i in range(checks):
        if n[i] != n[-(i+1)]:
            return False
    return True

ans = 0

for n1 in range(999, 500, -1):
    for n2 in range(999, 500, -1):
        n = n1*n2
        if is_palandrome(str(n)) == True:
            if n > ans:
                ans = n
            
print(ans) # 906609