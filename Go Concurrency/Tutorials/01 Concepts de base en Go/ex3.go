// Exercice 3 : Les tableaux et les slices

// Initialisation d’un tableau:

// var scores [10]int
// scores[0] = 339
// ou
// scores := [4]int{9001, 9333, 212, 33}

// Écrire un programme qui traverse un tableau:
package main

import "fmt"

func main() {
	scores := [4]int{9001, 9333, 212, 33}
	for i, val := range scores {
		fmt.Printf("Score %d is %d\n", i, val)
	}
}

// Initialisation d’un slice de longueur 10 et de capacité 10 (la capacitéétant la dimension du tableau
// 	auquel réfère le slice.

scores := make([]int, 10)

// Dimension et capacité peuvent être spécifiées séparément:

scores := make([]int, 0, 10)

// Voici 4 facons de créer un slice:

names := []string{"leto", "jessica", "paul"}
checks := make([]bool, 10)
var names []string
scores := make([]int, 0, 10)

// Avec la fonction append on peut accroitre la capacité d’un slice à volonté :

package main

import "fmt"

func main() {
	scores := make([]int, 0, 5)
	c := cap(scores)
	fmt.Println(c)
	for i := 0; i < 25; i++ {
		scores = append(scores, i)
		// if our capacity has changed,
		// Go had to grow our array to accommodate the new data
		if cap(scores) != c {
			c = cap(scores)
			fmt.Println(c)
		}
	}
}