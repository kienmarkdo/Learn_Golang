/*
Exercice 1 : synchronisation
Concevoir un programme dans lequel la fonction numberGen genère des entiers entre start et
(start + count), et la fonction printNumbers imprime les entiers générés à l’écran (utiliser la
synchronisation et fermeture des channels).
*/

package main

import "fmt"

func numberGen(start, count int, out chan<- int) {
	for i := 0; i < count; i++ {
		out <- (start + i) // sends the value BACK TO MAIN!!
	}
	fmt.Println("WE ARE HERE!!!") // notice how this only executes at the end of the program
	close(out)
}
func printNumbers(in <-chan int, done chan<- bool) {
	for {
		value, ok := <-in // ok is false if channel has been closed
		if !ok {
			done <- true
			break
		}
		fmt.Println(value)
	}
}
func main() {
	numbers := make(chan int)
	done := make(chan bool)
	go numberGen(5, 6, numbers)
	go printNumbers(numbers, done)
	<-done
}
