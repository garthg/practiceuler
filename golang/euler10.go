// Find the sum of all the primes below two million.

package main

import (
	"fmt"
)

func euler10(max int) int {
	// invariant is that field is 0 if prime and 1 if composite for all indexes less than i
	field := make([]int, max, max)
	field[0] = 1
	field[1] = 1
	sum := 0
	for i := 2; i < max; i++ {
		if field[i] == 0 {
			sum += i
			for j := i + i; j < max; j += i {
				field[j] = 1
			}
		}
	}
	return sum
}

func main() {
	fmt.Println(euler10(10))
	fmt.Println(euler10(2000000))
}
