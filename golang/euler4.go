// Find the largest palindrome made from the product of two 3-digit numbers.

package main

import (
	"fmt"
)
import "./numberutil"

func max_palindrome(digits int) int {
	// Maximum first half is the first three digits of the maximum factor squared.
	max_first_half := numberutil.Pow_int_to_int(numberutil.Pow_10_to_int(digits)-1, 2) / numberutil.Pow_10_to_int(digits)
	min_factor := numberutil.Pow_10_to_int(digits - 1)
	max_factor := numberutil.Pow_10_to_int(digits) - 1
	for prefix := max_first_half; prefix >= min_factor; prefix-- {
		number := prefix * numberutil.Pow_10_to_int(digits)
		for i := 0; i < digits; i++ {
			number += prefix / numberutil.Pow_10_to_int(i) % 10 * numberutil.Pow_10_to_int(digits-i-1)
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
