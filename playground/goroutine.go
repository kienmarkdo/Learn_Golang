/* Followed this video : https://www.youtube.com/watch?v=LvgVSSpwND8*/

package main

import (
	"fmt"
	"time"
)

func main() {
	c := make(chan string)
	go count("sheep", c)

	// for {
	// 	msg, open := <-c
	// 	if !open {
	// 		break
	// 	}
	// 	fmt.Println(msg)
	// }
	for msg := range c {
		fmt.Println(msg)
	}

}

func count(thing string, c chan string) {
	for i := 1; i <= 5; i++ {
		c <- thing
		time.Sleep(time.Millisecond * 500)
	}

	close(c)
}

// func main() {
// 	var wg sync.WaitGroup
// 	wg.Add(1) // add one go routine for which the program will wait

// 	go func() {
// 		count("sheep")
// 		wg.Done()
// 	}()

// 	wg.Wait()
// }

// func count(thing string) {
// 	for i := 1; i <= 5; i++ {
// 		fmt.Println(i, thing)
// 		time.Sleep(time.Millisecond * 500)
// 	}
// }
