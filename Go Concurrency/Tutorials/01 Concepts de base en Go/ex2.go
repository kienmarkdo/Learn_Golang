// Exercice 2 : Fichier texte

// Comment lire les valeurs contenues dans ce fichier ?
// Chine 1427647786
// Mexique 126190788
// Canada 37074562
// France 64990511
// Iran 81800188
// Nigeria 195874683
// Algerie 42228408
// En utilisant Fscan ou Fscanf :

package main

import (
	"fmt"
	"os"
)

func main() {
	file, err := os.Open("pays.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()
	var (
		nom        string
		population int
	)

	for {
		n, err := fmt.Fscan(file, &nom, &population)

		if err == nil {
			fmt.Println(n, nom, population)
		} else {
			break
		}
	}
}
