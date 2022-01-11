/*
Learning Golang.

Currently following Tech with Tim and Jake Wright videos to learn the basic syntax of Golang.
The goal is to learn the syntax quickly to get a head start in CSI2520 - Programming Paradigms
*/

package main

import "fmt"

func main() {

	// explicit declaration
	var x int = 5
	var y int = 7
	var sum int = x + y

	// implicit declaration
	var a = 10
	var b = 20
	var product = a * b

	// mathematical declaration
	word1 := "hello"
	word2 := "world"

	fmt.Println(sum)
	fmt.Println(product)
	fmt.Printf("%s %s", word1, word2)
}
