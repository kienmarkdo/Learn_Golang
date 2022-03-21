/*
Exercice 3 : Composition avec des types embarqués

La composition en Go est un outil de réutilisation de code. Il est utile lorsqu’un veut bâtir un nouveau
type en enrichissant un type existant. Cela s’apparente à de l’héritage mais dans un cas ou les méthodes
réutilisées ne sont pas modifiées.
*/

package main

import "fmt"

type Personne struct {
	Nom    string
	Prenom string
}

func (p *Personne) Bonjour() {
	fmt.Printf("Bonjour, Je suis %s %s\n", p.Prenom, p.Nom)
}

type Employé struct {
	Personne
	Salaire float32
}

func main() {
	p1 := Personne{"Cesar", "Jules"}
	p1.Bonjour()
	p2 := &Employé{Personne{"Gates", "Bill"}, 15.25}
	p2.Bonjour()
}
