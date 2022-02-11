/*
Kien Do 300163370
CSI2520 - Laboratoire 03 Channels et erreurs

Exercice 2: Errors
La routine suivante calcule la racine carrée d’un nombre et divise le résultat. Lorsque le nombre
est négatif ou le diviseur est 0, l’exécution est échouait. Utilisez les deux erreurs dans la routine
rootDivN en implémentant leur interface erreur et modifier la routine main pour distinguer les
deux erreurs par leur type et ensuite imprimer le message correspondant. Vous ne devez pas
modifier la fonction prototype de rootDivN.
*/

package main

import (
	"errors"
	"fmt"
	"math"
)

type ErrorTest interface {
	IsError() (bool, error)
}

type NegError struct {
	num float64 // negative number
}

type Div0Error struct {
	num int
}

// ====================================================================

// func (e NegError) IsError() (IsError bool, err error) {
// 	if e.num < 0 {
// 		IsError = true
// 		err = errors.New(fmt.Sprintf("Main NegError: Negative number %f", e.num))
// 	} else {
// 		IsError = false
// 		err = nil
// 	}
// 	return
// }

// func (e Div0Error) IsError() (IsError bool, err error) {
// 	if e.num == 0 {
// 		IsError = true
// 		err = errors.New(fmt.Sprintf("Main Div0Error: Division by %d", e.num))
// 	} else {
// 		IsError = false
// 		err = nil
// 	}
// 	return
// }

// // func (e NegError) ErrorMessage() (msg string) {
// // 	if e.IsError() {
// // 		msg = fmt.Sprintf("Main NegError: Negative number %f", e.num)
// // 	} else {
// // 		msg = ""
// // 	}
// // 	return
// // }

// // func (e Div0Error) IsError() (IsError bool) {
// // 	return e.num == 0
// // }

// // func (e Div0Error) ErrorMessage() (msg string) {
// // 	if e.IsError() {
// // 		msg = fmt.Sprintf("Main Div0Error: Division by %d", e.num)
// // 	} else {
// // 		msg = ""
// // 	}
// // 	return
// // }

// func rootDivN(num float64, n int) (res float64, err error) {
// 	if num < 0.0 {
// 		return
// 	}
// 	if n == 0 {
// 		return
// 	}
// 	res = math.Sqrt(num) / float64(n)
// 	return
// }

// func main() {
// 	divs := []int{2, 10, 3, 0}
// 	nums := []float64{511.8, 0.65, -3.0, 2.123}
// 	for i, num := range nums {
// 		fmt.Printf("%d) sqrt(%f)/%d = ", i, num, divs[i])
// 		res, err := rootDivN(num, divs[i])
// 		negErr := NegError{num}
// 		divErr := Div0Error{divs[i]}

// 		if err == nil {
// 			fmt.Printf("%f\n", res)
// 		}
// 	}
// }

// ====================================================================

func rootDivN(num float64, n int) (res float64, err error) {
	if num < 0.0 {
		err = errors.New(fmt.Sprintf("Main NegError: Negative number %f", num))
		return
	}
	if n == 0 {
		err = errors.New(fmt.Sprintf("Main Div0Error: Division by %d", n))
		return
	}
	res = math.Sqrt(num) / float64(n)
	return
}

func main() {
	divs := []int{2, 10, 3, 0}
	nums := []float64{511.8, 0.65, -3.0, 2.123}

	for i, num := range nums {
		fmt.Printf("%d) sqrt(%f)/%d = ", i, num, divs[i])
		res, err := rootDivN(num, divs[i])
		if err == nil {
			fmt.Printf("%f\n", res)
		} else {
			fmt.Printf("%s\n", err)
		}
	}
}
