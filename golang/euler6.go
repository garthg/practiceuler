// Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

package main

import (
	"fmt"
)

import (
	"./numberutil"
)

func squared(x int) int {
	return numberutil.Pow_int_to_int(x, 2)
}

func euler6(input_max int) int {
	sum_of_squares := 0
	for i := 1; i <= input_max; i++ {
		sum_of_squares += squared(i)
	}
	square_of_sum := squared((input_max + 1) * input_max / 2)
	result := square_of_sum - sum_of_squares
	return result
}

func main() {
	fmt.Println(euler6(10))
	fmt.Println(euler6(100))
}
