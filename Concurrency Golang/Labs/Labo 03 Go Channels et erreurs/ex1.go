/*
Kien Do 300163370
CSI2520 - Laboratoire 03 Channels et erreurs

Exercice 1: Channels
Le programme suivant doit envoyer les numéros de 0 à 20 dans un Channel, les doubler dans un
filtre et ensuite les imprimer. Par contre, le programme n’arrête pas d’imprimer (Plusieurs 0).
*/

package main

import (
	"fmt"
)

func sendInt() (ch chan int) {
	defer fmt.Println("Sender ready!")
	ch = make(chan int)
	go func() {
		for i := 0; i < 20; i++ {
			ch <- i
		}
		close(ch)
	}()
	return
}

func filterInt(src <-chan int) (dst chan int) {
	defer fmt.Println("Filter ready!")
	dst = make(chan int)
	go func() {
		defer close(dst)
		open := true
		for open {
			var i int
			i, open = <-src
			if open {
				i *= 2
				dst <- i
			}
		}
	}()
	return
}

func main() {
	src := sendInt()
	dst := filterInt(src)
	for i := range dst {
		//i := <-dst
		fmt.Printf("%d ", i)
	}
	fmt.Println()
}
