package main

import "fmt"

var maxval = 1000

func main() {
  sum := 0
  result := make(chan bool, maxval)
  for i := 0; i < maxval; i++ {
    go func(i int) {
      if i % 3 == 0 || i % 5 == 0 {
        sum += i
      }
      result <- true
    }(i)
  }
  for i := 0; i < maxval; i++ {
    <- result
  }
  fmt.Println(sum)
}
