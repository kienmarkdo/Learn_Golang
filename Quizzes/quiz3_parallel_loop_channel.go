/* Le programme ci-dessous démontre l'utilisation d'une boucle parallèle.
Toutefois ce programme devrait attendre la fin de toutes les go routines avant de se terminer.
Retirer l'énoncé Sleep et ajouter un mécanisme de synchronisation.
Votre solution doit fonctionner même si la dimension du tableau est changée. */

package main

import (
	"fmt"
	"time"
)

func main() {

	x := []int{3, 1, 4, 1, 5, 9, 2, 6}

	var y [8]int

	// boucle parallele

	for i, v := range x {

		go func(i int, v int) {

			y[i] = calcul(v)

		}(i, v) // appel a la goroutine

	}

	// ajouter synchronisation

	time.Sleep(1 * time.Second)

	fmt.Println(y)

}

// vous pouvez ajouter un channel a la liste des parametres

func calcul(v int) int {

	return 2*v*v*v + v*v

}
