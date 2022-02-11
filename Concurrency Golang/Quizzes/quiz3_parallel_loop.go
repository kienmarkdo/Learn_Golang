/*
The following program demonstrates a parallel loop in Go.
However, this program should wait for the go routines to terminate before ending.
Remove the Sleep statement and replace it by a proper synchronization.

Le programme ci-dessous démontre l'utilisation d'une boucle parallèle.
Toutefois ce programme devrait attendre la fin de toutes les go routines avant de se terminer.
Retirer l'énoncé Sleep et ajouter un mécanisme de synchronisation.
*/

package main

import (
	"fmt"
	"sync"
)

func main() {

	var wg sync.WaitGroup
	x := []int{3, 1, 4, 1, 5, 9, 2, 6}

	var y [8]int

	// boucle parallele

	for i, v := range x {

		wg.Add(1)

		go func(i int, v int) {

			y[i] = calcul(v)
			wg.Done()

		}(i, v) // appel a la goroutine

		wg.Wait()

	}

	// ajouter synchronisation

	fmt.Println(y)

}

func calcul(v int) int {

	return 2*v*v*v + v*v

}
