package numberutil

import "math"

func Pow_int_to_int(base int, exp int) int {
	if exp == 0 {
		return 1
	}
	if exp > 0 {
		// I don't actually know if this is faster than the casting.
		out := 1
		for i := 1; i <= exp; i++ {
			out *= base
		}
		return out
	}
	return int(math.Pow(float64(base), float64(exp)))
}

func Pow_10_to_int(exp int) int {
	return Pow_int_to_int(10, exp)
}

func Max_int(x int, y int) int {
	if y > x {
		return y
	}
	return x
}

func Squared_int(base int) int {
	return base * base
}
