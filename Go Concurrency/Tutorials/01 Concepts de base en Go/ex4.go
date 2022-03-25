// Exercice 4: Fonction comme paramètre

// Écrire une fonction permettant qui retourne un slice contenant les éléments d’un slice qui satisfont une
// certaine condition.
// (A tester avec un exemple d’un filtre qui retient les éléments qui sont multiples de 3)

package main

import (
	"fmt"
)

func Filter(s []int, fn func(int) bool) []int {
	var p []int // == nil
	for _, v := range s {
		if fn(v) {
			p = append(p, v)
		}
	}
	return p
}
func mult3(n int) bool {
	return n%3 == 0
}
func main() {
	tab := [10]int{3, 7, 2, 9, 1, 6, 12, 23, 66, 37}
	f := Filter(tab[:], mult3)
	fmt.Println(f)
}
