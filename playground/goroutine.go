/* Followed this video : https://www.youtube.com/watch?v=LvgVSSpwND8*/

package main

import (
	"fmt"
)

func main() {

	c := make(chan string)
	c <- "hello" // this doesn't work because the program stops here to wait to receive info from the sender

	msg := <-c
	fmt.Println(msg)
}
