/*
Kien Do 300163370
CSI2520 - Laboratoire 03 Channels et erreurs

Exercice 3: Attendre la Routine Go
Le programme suivant calcule la somme de racine carrée des nombres. Chaque routine s’exécute
dans sa propre go routine et envoie le message au programme main avec la Channel dédié. Le
programme quitte très tôt. Modifier la routine main pour s’assurer que le programme s’arrête
uniquement lorsque le dernier résultat est reçu. De plus, les résultats obtenus doivent être dans
l’ordre d’où ils sont calculés.
*/

package main

import (
	"fmt"
	"math"
	"math/rand"
	"time"
)

func numbers(sz int) (res chan float64) {
	res = make(chan float64)
	go func() {
		defer close(res)
		num := 0.0
		time.Sleep(time.Duration(rand.Intn(1000)) * time.Microsecond)
		for i := 0; i < sz; i++ {
			num += math.Sqrt(math.Abs(rand.Float64()))
		}
		num /= float64(sz)
		res <- num
		return
	}()
	return
}

func main() {
	var nGo int
	rand.Seed(42)
	fmt.Print("Number of Go routines: ")
	fmt.Scanf("%d \n", &nGo)

	res := make([]chan float64, nGo)

	for i := 0; i < nGo; i++ {
		res[i] = numbers(1000)
		// num := <-res[i]
		// fmt.Println(i, " ", num)
	}

	for nGo > 0 {
		for i := range res {
			select {
			case num, open := <-res[i]:
				if open {
					fmt.Println(i, ": ", num)
				} else {
					nGo--
				}

			}
		}

	}

}
