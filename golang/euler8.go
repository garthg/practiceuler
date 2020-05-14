package main

import (
	"fmt"
	"strconv"
	"strings"
)

var input_string = `
		73167176531330624919225119674426574742355349194934
		96983520312774506326239578318016984801869478851843
		85861560789112949495459501737958331952853208805511
		12540698747158523863050715693290963295227443043557
		66896648950445244523161731856403098711121722383113
		62229893423380308135336276614282806444486645238749
		30358907296290491560440772390713810515859307960866
		70172427121883998797908792274921901699720888093776
		65727333001053367881220235421809751254540594752243
		52584907711670556013604839586446706324415722155397
		53697817977846174064955149290862569321978468622482
		83972241375657056057490261407972968652414535100474
		82166370484403199890008895243450658541227588666881
		16427171479924442928230863465674813919123162824586
		17866458359124566529476545682848912883142607690042
		24219022671055626321111109370544217506941658960408
		07198403850962455444362981230987879927244284909188
		84580156166097919133875499200524063689912560717606
		05886116467109405077541002256983155200055935729725
		71636269561882670428252483600823257530420752963450
		`

func euler8(buffer_length int) int {
	// Circular buffer of the last buffer_length digits seen
	var buffer []int
	buffer_end := buffer_length - 1
	// Last digit that was removed from the buffer
	removed := 1
	// Current product of the buffer (so we can do incremental updates and not re-multiply the whole thing every time)
	product := 1
	// Max seen product
	var product_max int
	// Iterate over the buffer. Each step:
	// Get rid of whitespace due to the paste above
	// Parse to a number
	// Update the buffer, tracking what we removed
	// Update the product based on the addition/removal
	// Update the max
	for i := 0; i < len(input_string); i++ {
		c := input_string[i : i+1]
		if !strings.Contains("0123456789", c) {
			continue
		}
		number, _ := strconv.Atoi(c)
		if len(buffer) < buffer_length {
			buffer = append(buffer, number)
		} else {
			buffer_end = (buffer_end + 1) % buffer_length
			removed = buffer[buffer_end]
			buffer[buffer_end] = number
		}
		if removed != 0 {
			// Could just do the for loop below instead, but this should save a tiny bit of time
			if product != 0 {
				product /= removed
				product *= number
			}
		} else {
			product = 1
			for j := 0; j < len(buffer); j++ {
				product *= buffer[j]
			}
		}
		if product > product_max {
			product_max = product
		}
	}
	return product_max
}

func main() {
	fmt.Println(euler8(4))
	fmt.Println(euler8(13))
}
