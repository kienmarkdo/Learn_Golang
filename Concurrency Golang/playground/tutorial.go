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
	// key value data structure
	vertices := make(map[string]int)

	vertices["triangle"] = 3
	vertices["square"] = 4
	vertices["circle"] = 0

	fmt.Println(vertices)

	delete(vertices, "square") // see more map functions here https://yourbasic.org/golang/maps-explained/

	fmt.Println(vertices)

}
