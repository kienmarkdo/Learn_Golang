/*
Kien Do 300163370
CSI 2520 - Paradigmes de programmation
Laboratoire 1 - Go Basics
Exercice 1: Functions

Écrivez une fonction Go qui prend comme paramètre une variable de type float et retourne deux
variables de type entier. Le premier entier est l’arrondissement inférieur (floor value) de la
variable flottante et le deuxième entier est l’arrondissement supérieur (ceiling value) de la
variable flottante.
*/

package main

import (
	"fmt"
	"math"
)

func main() {
	var test1 float64 = 3.1
	res1, res1b := floatToInt(test1)

	fmt.Println("Test 1   : ", test1)
	fmt.Printf("Result 1 : %d, %d", res1, res1b)
}

func floatToInt(numFloat float64) (int, int) {
	var floorInt int = int(math.Floor(numFloat))
	var ceilInt int = int(math.Ceil(numFloat))
	return floorInt, ceilInt
}
