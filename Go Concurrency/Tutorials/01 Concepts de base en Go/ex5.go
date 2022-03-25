// Exercice 5 : Les fonctions variadique

// Montrer comment on peut créer une fonction acceptant un nombre variable de paramètres.

package main

import "fmt"

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
