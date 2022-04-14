/*
Question 3 Go

b) Go Routines and Channels

Complete the go routine in the lambda below. The go routine is to send the numbers in the array on
the channel and then close the channel.
*/

package main

import "fmt"

func main() {
	numbers := []int{216, 218, 221, 260}
	ch := make(chan int)

	// Your solution
	go func() {
		defer close(ch)
		for _, num := range numbers {
			ch <- num
		}
	}()

	for {
		if num, ok := <-ch; !ok {
			fmt.Println("Channel closed")
			break
		} else {
			fmt.Println(num)
		}
	}
}
