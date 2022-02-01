/*
Kien Do 300163370
CSI 2520 - Paradigmes de programmation
Laboratoire 1 - Go Basics
Exercice 2: Looping
*/

package main

import (
	"fmt"
)

func main() {
	lineWidth := 5
	symb := "x"
	lineSymb := symb
	formatStr := fmt.Sprintf("%%%ds\n", lineWidth)
	fmt.Printf(formatStr, lineSymb)

	for i := 1; i < lineWidth; i++ {
		lineSymb = lineSymb + symb
		fmt.Printf(formatStr, lineSymb)
	}

	for i := lineWidth - 1; i > 0; i-- {
		lineSymb = lineSymb[0:i]
		fmt.Printf(formatStr, lineSymb)
	}

}
