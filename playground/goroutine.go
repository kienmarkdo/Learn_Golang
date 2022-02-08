/* Followed this video : https://www.youtube.com/watch?v=LvgVSSpwND8*/

package main

import (
	"fmt"
)

func main() {

	c := make(chan string, 2) // this gets around the sending/receiving issue; but the channel size must be declared
	c <- "hello"              // this doesn't work because the program stops here to wait to receive info from the sender
	c <- "world"

	msg := <-c
	fmt.Println(msg)

	msg = <-c
	fmt.Println(msg)
}
