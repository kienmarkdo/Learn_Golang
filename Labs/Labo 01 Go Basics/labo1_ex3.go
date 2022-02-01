/*
Kien Do 300163370
CSI 2520 - Paradigmes de programmation
Laboratoire 1 - Go Basics
Exercice 3: Structs and Pointers
*/

package main

import (
	"fmt"
)

type Person struct {
	lastName  string
	firstName string
	iD        int
}

func main() {
	nextId := 101
	for {
		var (
			p   Person
			err error
		)
		nextId, err = inPerson(&p, nextId)
		if err != nil {
			fmt.Println("Invalid entry ... exiting")
			break
		}
		printPerson(p)
	}
}

func inPerson(p *Person, id int) (int, error) {
	fmt.Print("Enter first name: ")
	var firstName string
	fmt.Scanln(&firstName)

	fmt.Print("Enter last name: ")
	var lastName string
	fmt.Scanln(&lastName)

	p.firstName = firstName
	p.lastName = lastName
	p.iD = id

	return id + 1, nil
}

func printPerson(p Person) {
	fmt.Printf("\nName: %s %s\nId: %d\n\n", p.firstName, p.lastName, p.iD)
}
