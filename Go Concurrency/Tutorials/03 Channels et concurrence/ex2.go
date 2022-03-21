/*
Exercice 2 : select et la méthode time.After
Concevoir un programme qui lit les données entrant dans des channels pour certaine durée de temps.
*/

package main

import (
	"fmt"
	"time"
)

// func tr(c chan int, w time.Duration) {
// 	defer func() {
// 		// https://go.dev/blog/defer-panic-and-recover
// 		r := recover() // built-in go function; to resolve the panic that will be caused by the block of code below
// 		if r != nil {
// 			fmt.Print("Il y a un panic!!\n")
// 			fmt.Print("panic a été résolu et le channel a été fermé. On va arrêter à envoyer des données.\n\n")
// 		}
// 	}()

// 	i := 0
// 	for {
// 		time.Sleep(w)
// 		c <- i
// 		i++
// 	}
// }

// func main() {
// 	m1 := make(chan int)
// 	m2 := make(chan int)
// 	go tr(m1, 1*time.Second)
// 	go tr(m2, 1*time.Second)
// 	a := time.After(5 * time.Second)
// P1:
// 	for {
// 		select {
// 		case msg1 := <-m1:
// 			fmt.Println("received from m1 message", msg1)
// 		case msg2 := <-m2:
// 			fmt.Println("received from m2 message", msg2)
// 		case <-a:
// 			fmt.Println("Time out")
// 			break P1
// 		}
// 		time.Sleep(time.Second)
// 	}
// 	close(m1)
// 	close(m2)
// 	time.Sleep(3 * time.Second)
// }

// cette version ci-dessous est mieux que la version ci-dessus

func tr(done chan bool, w time.Duration) <-chan int {
	intChan := make(chan int)
	go func() {
		defer close(intChan)
		defer fmt.Println("Channel data sending stopped")
		i := 0
		for {
			time.Sleep(w)
			select {
			case intChan <- i:
				i++
			case <-done: // we can always read from a closed channel
				return
			}
		}
	}()
	return intChan
}

func main() {
	done := make(chan bool)
	m1 := tr(done, 1*time.Second)
	m2 := tr(done, 3*time.Second)
	a := time.After(5 * time.Second)
P1:
	for {
		select {
		case msg1 := <-m1:
			fmt.Println("received from m1 message", msg1)
		case msg2 := <-m2:
			fmt.Println("received from m2 message", msg2)
		case <-a:
			fmt.Println("Time out")
			break P1
		}
		time.Sleep(time.Second)
	}
	close(done)
	time.Sleep(3 * time.Second)
}
