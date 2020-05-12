// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

package main

import (
	"fmt"
)

import (
	"./numberutil"
	"./primefactorize"
)

func euler5(max_factor int) int {
	products := make(map[int]int)
	for i := 2; i <= max_factor; i++ {
		factors := primefactorize.Primefactorize(i)
		for factor, count := range factors {
			products[factor] = numberutil.Max_int(products[factor], count)
		}
	}
	result := 1
	for factor, count := range products {
		result = result * numberutil.Pow_int_to_int(factor, count)
	}
	return result
}

func main() {
	fmt.Println(euler5(10))
	fmt.Println(euler5(20))
}
