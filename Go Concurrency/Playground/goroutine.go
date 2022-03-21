/* Followed this video : https://www.youtube.com/watch?v=LvgVSSpwND8*/

package main

import "fmt"

func main() {
	// Common pattern: Worker pools
	// queue for work to be done and multiple concurrent workers pulling items off the queue

	jobs := make(chan int, 100) // make 100 channels of integers
	results := make(chan int, 100)

	go worker(jobs, results) // make worker a concurrent routine then send it the two previously declared channels
	go worker(jobs, results)
	go worker(jobs, results)
	go worker(jobs, results) // make more workers

	// fill up the jobs channel with 100 numbers (0 to 99, inclusive)
	// since it's buffered, it's not gonna block anything
	for i := 0; i < 100; i++ {
		jobs <- i
	}

	close(jobs)

	for i := 0; i < 100; i++ {
		fmt.Println(<-results) // receive each result in one results channel at a time then display it
	}
}

// one channel to send content, one channel to receive content
// receive from jobs, send on results
// now if we try to send on jobs, for example, there will be a compile time error
func worker(jobs <-chan int, results chan<- int) {
	for n := range jobs {
		// receive content from jobs, calculate fib(n) using the integer content in the jobs channel
		//  then put the results of fib(n) into the results channel
		results <- fib(n)
	}
}

func fib(n int) int {
	if n <= 1 {
		return n
	}

	return fib(n-1) + fib(n-2)
}
