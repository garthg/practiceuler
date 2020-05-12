// What is the 10 001st prime number?

package main

import (
	"fmt"
)

import (
	"./primefactorize"
)

func euler7(target int) int {
	if target < 1 {
		return -1
	}
	var primes []int
	i := 2
	for len(primes) < target {
		factors := primefactorize.Primefactorize(i)
		if len(factors) == 1 {
			for _, v := range factors {
				if v == 1 {
					primes = append(primes, i)
				}
			}
		}
		i++
	}
	return primes[len(primes)-1]
}

func main() {
	fmt.Println(euler7(6))
	fmt.Println(euler7(10001))
}
