package main
import (
    "fmt"
    "math"
)

func getPrimes(num int) []int {
    primes := []int{2,3}
    for n:=5; n < num+1; n+=2 {
        var isPrime bool = true
        for _, p := range primes {
            if n % p == 0 {
                isPrime = false
                break
            }
        }
        if isPrime == true {
            primes = append(primes, n)
        }
    }
    n := primes[len(primes)-1]
    for {
        n += 2
        isPrime := true
        for _, p := range primes {
            if n % p == 0 {
                isPrime = false
                break
            }
        }
        if isPrime == true {
            primes = append(primes, n)
            return primes
        }
    }
}

func main() {

    MaxNum := 999966663333
    var num int = int(math.Floor(math.Sqrt(float64(MaxNum))))
    var p [] int = getPrimes(num)
    fmt.Println("primes finished")

    var sum int = 0

    for i := 0; i < len(p) - 1; i++ {

        lp := p[i]
        up := p[i+1]

        lps := int(math.Pow(float64(lp), 2))
        ups := int(math.Pow(float64(up), 2))

        for a := lps + lp; a < ups; a += lp {
            if a % up != 0 && a < MaxNum {
                sum += a
            }
        }
        for b := ups - up; b > lps; b -= up {
            if b % lp != 0 && b < MaxNum {
                sum += b
            }
        }
    }
    fmt.Println(sum)
}