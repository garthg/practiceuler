package main

import (
	"fmt"
)

import (
	"./numberutil"
	"./primefactorize"
)

func main() {
	max_factor := 20
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
	fmt.Println(result)
}
