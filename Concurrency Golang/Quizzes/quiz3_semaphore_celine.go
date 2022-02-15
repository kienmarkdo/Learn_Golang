package main

import (
	"fmt"
)

// Utilisation d'une semaphore pour la synchronisation
type semaphore chan bool

// fonction qui va attendre toutes les go routines
func (s semaphore) Wait(n int) {
	for i := 0; i < n; i++ {
		<-s
	}
}

// fonction qui signale la fin d'une go routine
func (s semaphore) Signal() {
	s <- true
}

func main() {

	x := []int{3, 1, 4, 1, 5, 9, 2, 6}

	var y [8]int

	sem := make(semaphore, len(x))

	// boucle parallele

	for i, v := range x {

		go func(i int, v int) {

			y[i] = calcul(v, sem)

			sem.Signal()
		}(i, v) // appel a la goroutine

	}

	// ajouter synchronisation
	sem.Wait(len(x))

	fmt.Println(y)

}

// vous pouvez ajouter un channel a la liste des parametres

func calcul(v int, sem semaphore) int {

	return 2*v*v*v + v*v

}
