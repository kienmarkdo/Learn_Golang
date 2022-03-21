// version 2 en utilisant les channels au lieu de waitgroup

package main

import (
	"fmt"
)

func main() {

	x := []int{3, 1, 4, 1, 5, 9, 2, 6}
	var y [8]int
	c := make(chan int, len(x))

	// boucle parallele

	for i, v := range x {

		go func(i int, v int) {
			calcul(v, c)

		}(i, v) // appel a la goroutine

		y[i] = <-c
	}

	fmt.Println(y)

}

// vous pouvez ajouter un channel a la liste des parametres

func calcul(v int, c chan int) {
	c <- 2*v*v*v + v*v
}
