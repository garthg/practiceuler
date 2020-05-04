// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143 ?

package main

import (
	"fmt"
	"os"
	"strconv"
)
import "./primefactorize"

func main() {
	input, err := strconv.Atoi(os.Args[1])
	if err != nil {
		fmt.Println(err)
	}
	factors := primefactorize.Primefactorize(input)
	max_factor := 0
	for k, _ := range factors {
		if k > max_factor {
			max_factor = k
		}
	}
	fmt.Println(factors)
	fmt.Println(max_factor)
}
