/*
Exercice 2 : Les interfaces

1. Définir une interface pour les formes géométriques qui contient les méthodes area et périmètre
2. Définir une fonction measure qui prend comme paramètre une interface géométrique et affiche
l’aire et le périmètre de la forme géométrique.

Définir une fonction main qui utilise la fonction measure pour afficher l’aire et le périmètre d’un carré et
d’un cercle.
*/

package main

import (
	"fmt"
	"math"
)

// declare a shape in general then declare actual shapes later (i.e.: rectangle, circle, triangle, etc.)
type shape interface {
	name() string
	area() float64
	perim() float64
}

// declare shape structures (rectangle, circle, triangle, etc.)
type rect struct {
	s             string
	height, width float64
}

type circ struct {
	s      string
	radius float64
}

type tria struct {
	s            string
	base, height float64
}

// these getters below cannot be passed by reference as the objects need to be created
// name getters
func (r rect) name() string { return r.s }
func (c circ) name() string { return c.s }
func (t tria) name() string { return t.s }

// area getters
func (r rect) area() float64 { return r.height * r.width }
func (c circ) area() float64 { return math.Pow(c.radius, 2) }
func (t tria) area() float64 { return (t.base * t.height) / 2 }

// perimeter getters
func (r rect) perim() float64 { return 2 * (r.height + r.width) }
func (c circ) perim() float64 { return 2 * c.radius * math.Pi }

func main() {
	shapes := make([]shape, 0)

	r1 := rect{"rectangle 1", 10, 5}
	shapes = append(shapes, r1)
	measure(shapes[0])
}

func measure(s shape) {
	fmt.Printf("Shape: %s\n", s.name())
	fmt.Printf("Area: %f\n", s.area())
	fmt.Printf("Perimeter: %f\n\n", s.perim())
}
