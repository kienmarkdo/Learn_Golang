/*
Learning Golang.

Currently following Tech with Tim and Jake Wright videos to learn the basic syntax of Golang.
The goal is to learn the syntax quickly to get a head start in CSI2520 - Programming Paradigms
*/

package main

import (
	"fmt" // fmt documentation https://pkg.go.dev/fmt
)

func main() {
	// empty array of int with a specified size
	var a [5]int
	a[2] = 7

	// array of int with a non-specified size (slices) (size cannot be change after initialization)
	arrSlice := []int{0, 1, 2}
	// this will not work arrSlice[3] = 3
	fmt.Println(arrSlice)

	b := []int{5, 4, 3, 2, 1}
	b = append(b, 13) // creates a new array, recopies it back into b
	fmt.Println(b)

	// This code below would not work as it is not a slice
	// arrFixedLen := [2]string{"word1", "word2"}
	// arrFixedLen = append(arrFixedLen, "word3")
	// fmt.Println(arrFixedLen)

}
