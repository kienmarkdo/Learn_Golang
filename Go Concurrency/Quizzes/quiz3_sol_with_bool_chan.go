package main

import (
	"fmt"
)

func main() {

	x := []int{3, 1, 4, 1, 5, 9, 2, 6}

	var y [8]int

	size := len(x)

	done := make(chan bool, size)

	// parallel loop

	for i, v := range x {

		go func(i int, v int) {

			y[i] = calcul(v, done)

		}(i, v) // call to goroutine

	}

	for i := 0; i < size; i++ {
		<-done // Blocks waiting for a receive
	}

	fmt.Println(y)

}

// you can add a channel to the list of parameters
func calcul(v int, ch chan bool) int {
	ch <- true
	return 2*v*v*v + v*v

}
