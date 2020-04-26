// sum of even fibonacci for values that do not exceed 4 million
// correct answer from my ruby code: 4613732

package main

import (
	"fmt"
	"math"
)

func main() {
	limit := 4 * int(math.Pow(10, 6))
	sum := 0
	f0 := 1
	f1 := 1
	for f1 <= limit {
		f_next := f0 + f1
		f0 = f1
		f1 = f_next
		if f1%2 == 0 {
			sum += f1
		}
	}
	fmt.Println(sum)
}
