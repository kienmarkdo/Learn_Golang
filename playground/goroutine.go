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
		// this is slow because channel c1 is waiting for c2 to finish before executing, even though it's already done
		fmt.Println(<-c1)
		fmt.Println(<-c2)
	}
}
