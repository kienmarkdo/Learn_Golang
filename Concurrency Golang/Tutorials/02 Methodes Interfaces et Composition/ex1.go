/*
Exercice 1 : Les méthodes

1. Créer une structure rect qui stocke la hauteur et largeur d’un rectangle
2. Créer une fonction area qui calcule l’aire d’un rectangle
3. Créer une fonction perim qui calcule le périmètre d’un rectangle
4. Créer une fonction main qui utilise les fonctions et la structure ci-dessus pour afficher l’aire et le
périmètre d’un rectangle
*/

package main

import "fmt"

// import (
// 	"fmt"
// )

type rect struct {
	hauteur, largeur int
}

// Cette méthode est une méthode donc elle appartient à rect; elle n'est pas une function
// pass by pointer; doesn't really matter since we aren't changing its values
func (r *rect) aire() int {
	return r.hauteur * r.largeur
}

// pass by copy/value; can't change its values
func (r rect) perim() int {
	return (r.hauteur + r.largeur) * 2
}

func (r *rect) afficherAirePerim() {
	fmt.Printf("L'aire: %d\n", r.aire())
	fmt.Printf("Le périmètre: %d\n", r.perim())
}

func main() {
	tempRec := rect{3, 4}
	//tempRec := rect{hauteur: 5, largeur: 10} // another way to define the struct
	// fmt.Printf("L'aire: %d\n", tempRec.aire())
	// fmt.Printf("Le périmètre: %d\n", tempRec.perim())
	tempRec.afficherAirePerim()

}
