package primefactorize

func Primefactorize(x int) map[int]int {
	remainder := x
	factor := 2
	factors := make(map[int]int)
	for factor*factor <= remainder {
		for remainder%factor == 0 {
			remainder = remainder / factor
			factors[factor] += 1
		}
		factor += 1
	}
	if remainder != 1 {
		factors[remainder] += 1
	}
	return factors
}
