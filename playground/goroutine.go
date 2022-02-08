/* Followed this video : https://www.youtube.com/watch?v=LvgVSSpwND8*/

package main

import (
	"fmt"
	"time"
)

func main() {

	c1 := make(chan string)
	c2 := make(chan string)

	go func() {
		for {
			c1 <- "Every 500ms"
			time.Sleep(time.Millisecond * 500)
		}
	}()

	go func() {
		for {
			c2 <- "Every 2000ms"
			time.Sleep(time.Millisecond * 2000)
		}
	}()

	for {
		// with the select keyword, this is much faster as it processes whichever channel finishes first
		// as such, channel c1 will execute 4 times while channel c2 is still waiting to execute
		select {
		case msg1 := <-c1:
			fmt.Println(msg1)
		case msg2 := <-c2:
			fmt.Println(msg2)
		}

	}
}
