/*
Exercice 3 : Les filtres
Que fait le programme suivant?
*/

package main

import "fmt"

func ping(pings chan<- string, msg string) {
	pings <- msg
}
func pong(pings <-chan string, pongs chan<- string) {
	msg := <-pings
	pongs <- msg
}
func main() {
	pings := make(chan string, 1)
	pongs := make(chan string, 1)
	ping(pings, "passed message")
	pong(pings, pongs)
	fmt.Println(<-pongs)

	/*
		Pings and "passed message" get sent to a function. The message then gets put into pings.
		Now we go back to main and call pong().
		Pong will take out the content in pings, put it into a string msg, then put msg into pongs.
		We now go back to main() and take out the content of pongs into a fmt.Println() and print it.
	*/
}
