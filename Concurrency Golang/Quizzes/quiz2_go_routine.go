/* Soit le programme Go suivant permettant le traitement parallele de deux slices d'un tableau.
Ici, la synchronisation est réalisée avec un WaitGroup.
Réécrire le programme est effectuant, cette fois, une synchronisation avec un channel de booléens (chan bool).
Vous ne pouvez donc plus utiliser le package sync: */

package main

import (
	"fmt"
)

type semaphore chan bool

// afin d'acquerir n resources
func (s semaphore) acquiere(n int) {

	for i := 0; i < n; i++ {
		s <- true
	}
}

// afin de liberer n resources
func (s semaphore) libere(n int) {

	for i := 0; i < n; i++ {
		<-s
	}
}

// MUTEX
// verouiller
func (s semaphore) Lock() {
	s.acquiere(1)
}

// deverouiller
func (s semaphore) Unlock() {
	s.libere(1)
}

// attendre
func (s semaphore) Wait(n int) {
	s.libere(n)
}

// signaler
func (s semaphore) Signal() {
	s.acquiere(1)
}

func main() {

	x := []int{3, 1, 4, 1, 5, 9, 2, 6}
	var y [8]int
	mutex := make(semaphore, 2)

	// boucle parallelisée en 2 slices
	go calcul2(x[:4], y[:4], mutex)
	go calcul2(x[4:], y[4:], mutex)

	mutex.Wait(2)

	// affichage des resultats
	for i, v := range y {
		fmt.Printf("[%d] = %d\n", i, v)
	}

}

func calcul2(in []int, out []int, sem semaphore) {

	for i, v := range in {
		out[i] = 2*v*v*v + v*v

	}

	sem.Signal()
}
