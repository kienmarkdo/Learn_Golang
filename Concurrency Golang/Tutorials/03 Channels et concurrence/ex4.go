/*
Exercice 3 (cont.) : Les filtres
Le programme suivant permet de trouver 20 nombres premiers en utilisant une chaine de filtres.
Expliquer son fonctionnement.
*/

package main

import "fmt"

// Envoie la séquence 2, 3, 4, ... au channel 'ch'.
func Generate(ch chan<- int) {
	for i := 2; ; i++ {
		ch <- i // Envoie i au channel 'ch'.
	}
}

// Copie les valeurs du channel 'in' au channel 'out' en enlèvant ceux divisible par 'p'
func Filter(in <-chan int, out chan<- int, p int) {
	for {
		i := <-in // Reçois les valeurs de 'in'.
		// first iteration: in = {3,4,5,6...,100} p = 2
		// put into out the following values: {3,5,7,...99}
		if i%p != 0 {
			out <- i // Envoie i au channel 'ch1'. Puis envoie i au channel 'ch' en main().
		}
	}
}

func main() {
	ch := make(chan int) // Créer un nouveau channel.
	go Generate(ch)      // Nous lançons la goroutine Generate
	fmt.Println("NOTE : It doesn't even continue from here. \nIt continues at p := <-ch... This gets executed after go Generate() even does anything.")

	for i := 0; i < 20; i++ {
		p := <-ch
		print(p, "\n")
		ch1 := make(chan int)
		go Filter(ch, ch1, p) // tout les filtres sont enchainés
		ch = ch1              // first iteration: ch had {3,4,5...,100} but now we overwrite it with ch1 which contains {3,5,7...,99}
	}
}
