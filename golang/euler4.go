// Find the largest palindrome made from the product of two 3-digit numbers.

package main

import (
	"fmt"
	"math"
)

func pow_int(base int, exp int) int {
	return int(math.Pow(float64(base), float64(exp)))
}

func pow_10_int(x int) int {
	return pow_int(10, x)
}

func max_palindrome(digits int) int {
	// Maximum first half is the first three digits of the maximum factor squared.
	max_first_half := pow_int(pow_10_int(digits)-1, 2) / pow_10_int(digits)
	min_factor := pow_10_int(digits - 1)
	max_factor := pow_10_int(digits) - 1
	for prefix := max_first_half; prefix >= min_factor; prefix-- {
		number := prefix * pow_10_int(digits)
		for i := 0; i < digits; i++ {
			number += prefix / pow_10_int(i) % 10 * pow_10_int(digits-i-1)
		}
		for factor := min_factor; factor <= max_factor; factor++ {
			if number%factor == 0 {
				quotient := number / factor
				if quotient >= min_factor && quotient <= max_factor {
					return number
				}
			}
		}
	}
	return -1
}

func main() {
	result := max_palindrome(3)
	fmt.Println(result)
}
