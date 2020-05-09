package numberutil

import "math"

func Pow_int_to_int(base int, exp int) int {
	return int(math.Pow(float64(base), float64(exp)))
}

func Pow_10_to_int(exp int) int {
	return Pow_int_to_int(10, exp)
}
