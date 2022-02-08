/* Soit le programme Go suivant permettant le traitement parallele de deux slices d'un tableau.
Ici, la synchronisation est réalisée avec un WaitGroup.
Réécrire le programme est effectuant, cette fois, une synchronisation avec un channel de booléens (chan bool).
Vous ne pouvez donc plus utiliser le package sync:*/

package main

import (
	"fmt"
	"sync"
	"time"
)

// func main() {

// 	var wg sync.WaitGroup
// 	x := []int{3, 1, 4, 1, 5, 9, 2, 6}
// 	var y [8]int

// 	wg.Add(2) // nombre de goroutines à synchroniser
// 	// boucle parallelisée en 2 slices
// 	go calcul2(x[:4], y[:4], &wg)
// 	go calcul2(x[4:], y[4:], &wg)

// 	wg.Wait() // on attend les 2 goroutines

// 	// affichage des resultats
// 	for i, v := range y {
// 		fmt.Printf("[%d] = %d\n", i, v)
// 	}

// }

// func calcul2(in []int, out []int, wg *sync.WaitGroup) {

// 	for i, v := range in {
// 		out[i] = 2*v*v*v + v*v
// 	}
// 	wg.Done() // signale que la goroutine est terminée
// }

func main() {
	var wg sync.WaitGroup
	wg.Add(1) // add one go routine for which the program will wait

	go func() {
		count("sheep")
		wg.Done()
	}()

	wg.Wait()
}

func count(thing string, c chan string) {
	for i := 1; i <= 5; i++ {
		fmt.Println(i, thing)
		time.Sleep(time.Millisecond * 500)
	}
}
