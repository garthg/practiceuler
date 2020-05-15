// There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc.

// Some math:
//
// We are given:
//   a^2 + b^2 = c^2
//   a + b + c = 1000
//
// We can construct Pythagorean triples as follows:
// For two positive integers m and n where m > n
// a = m^2 - n^2
// b = 2mn
// c = m^2 + n^2
// confirm: a^2 + b^2 = c^2
//          a^2 + b^2
//          = (m^2 - n^2)^2 + (2mn)^2
//          = m^4 - 2m^2n^2 + n^4 + 4m^2n^2
//          = m^4 + 2m^2n^2 + n^4
//          = (m^2 + n^2)^2
//          = c^2
//
// Now let a + b + c = 1000
// m^2 - n^2 + 2mn + m^2 + n^2 = 1000
// 2m^2 + 2mn = 1000
// m^2 + mn = 500
// m(m+n) = 500
//
// Now our algorithm can be to find integers m and n such that m(m+n) = 500
// We know that n = 500/m - m , so we just need to choose an m, and we can set some bounds on m.
//
// Find a minimum for m:
//   m > n
//   m > 500/m - m
//   2m > 500/m
//   2m^2 > 500
//   m^2 > 250
//   m > sqrt(250)
//
// Find a maximum for m:
//   0 < n
//   0 < 500/m - m
//   m < 500/m
//   m^2 < 500
//   m < sqrt(500)
//
// We also know that the minimum m and n in general is m=2 and n=1 because those are the smallest positive integers with m>n.
// Thus, the smallest a b and c are:
//   a = m^2 - n^2 = 4 - 1 = 3
//   b = 2mn = 2*2*1 = 4
//   c = m^2 + n^2 = 4 + 1 = 5
// So the smallest possible sum a+b+c is 3+4+5 = 12
//
// Also, we know that a Pythagorean triple always sums to an even number, because:
// if a and b are both even, then: a^2 + b^2 = even*even + even*even = even + even = even --> all even so a+b+c = even+even+even = even
// if a and b are both odd, then: a^2 + b^2 = odd*odd + odd*odd = odd + odd = even --> a+b+c = odd+odd+even = even
// if one of a and b is odd (assume a without loss of generality), then: a^2 + b^2 = odd*odd + even*even = odd + even = odd --> a+b+c = odd+even+odd = even

package main

import (
	"fmt"
	"math"
)

func euler9(target_sum int) int {
	if target_sum < 12 {
		fmt.Println("cannot have a Pythagorean triple with a sum below 12")
		return -1
	}
	if target_sum%2 != 0 {
		fmt.Println("cannot have a Pythagorean triple that sums to an odd number")
		return -1
	}
	var m, n, a, b, c int
	half_target_sum := target_sum / 2
	half_target_sum_f := float64(half_target_sum)
	// Compute the minimum and maximum using what we derived above.
	m_min := int(math.Ceil(math.Sqrt(half_target_sum_f / 2.0)))
	m_max := int(math.Floor(math.Sqrt(half_target_sum_f)))
	// Boundaries are strictly greater or less than square roots, so if it's a perfect square, have to go one number up or down.
	if m_max*m_max == half_target_sum {
		m_max--
	}
	if m_min*m_min == half_target_sum/2 {
		m_min++
	}
	// Then iterate over that space, checking for even divisors. If we don't find one, there is no triple.
	found := false
	for m = m_min; m <= m_max; m++ {
		if half_target_sum%m == 0 {
			found = true
			n = half_target_sum/m - m
			a = m*m - n*n
			b = 2 * m * n
			c = m*m + n*n
			fmt.Printf("%d %d --> %d %d %d\n", m, n, a, b, c)
			if a*a+b*b != c*c {
				fmt.Println("you screwed up the math: it's not a Pythagorean triple")
				return -1
			}
			if a+b+c != target_sum {
				fmt.Println("you screwed up the math: it doesn't add up to the target")
				return -1
			}
			// If there are multiple, return the smallest by breaking here. Are there ever multiple?
			break
		}
	}
	if !found {
		fmt.Println("no Pythagorean triples with that sum")
		return -1
	}
	if m == 0 {
		// This should never happen, but we can check just to be extra sure.
		fmt.Println("there are no Pythagorean triples (or the algorithm failed: m=0)")
		return -1
	}
	if a < 1 || b < 1 || c < 1 {
		fmt.Println("there are no Pythagorean triples (or the algorithm failed: one of a b c is < 1)")
		return -1
	}
	product := a * b * c
	return product
}

func main() {
	fmt.Println(euler9(12))
	fmt.Println(euler9(1000))
}
