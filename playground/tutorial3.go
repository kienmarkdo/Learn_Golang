package main

import (
	"fmt"
)

/// QUESTION 5: Variadic functions (functions that take an unknown number of variables, like String[] args in Java)
func join(del string, values ...string) string {
	var line string
	for i, v := range values {
		line = line + v
		if i != len(values)-1 {
			line = line + del
		}
	}
	return line
}

func main() {
	var line string
	names := []string{"Canada", "France", "Chine", "Rwanda"}
	line = join(",", names...)
	fmt.Println(line)
	// la fonction append est aussi variadique
	t1 := []int{10, 20, 30}
	t2 := []int{500, 600, 700}
	tt := append(t1, t2...)
	fmt.Println(tt)
}

// sortie produite :
// Canada,France,Chine,Rwanda
// [10 20 30 500 600 700]

/// QUESTION 4

// func main() {
// 	var scores [10]int
// 	scores[0] = 123

// 	table := [10]int{1, 2, 3, 4, 5, 6, 7, 8}
// 	fmt.Println(table)
// 	fmt.Println()

// 	for i := 0; i < 10; i++ {
// 		fmt.Print(table[i])
// 	}

// 	fmt.Println()

// 	for i, val := range table {
// 		//fmt.Print(val) // can't use fmt.Print because i is not used...
// 		// so u need to use Printf, include i in the Printf statement... even though you don't need it... bruh
// 		fmt.Printf("Score %d is %d\n", i, val)
// 	}

// 	// four ways to make slices
// 	names := []string{"leto", "jessica", "paul"}
// 	// checks := make([]bool, 10)
// 	// var names []string
// 	// scoresSlice := make([]int, 0, 10)

// 	for i := range names {
// 		fmt.Printf("%s ", names[i])
// 	}

// }
