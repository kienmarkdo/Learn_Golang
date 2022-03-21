/*
Kien Do 300163370
CSI2520 - Laboratoire 02 Méthodes et interfaces en Go

Exercice 2 : Interfaces et structures
*/

package main

import (
	"fmt"
	"time"
)

// interface Show
type Show interface {
	GetName() string
	GetShowStart() time.Time
	GetShowEnd() time.Time
	AddPurchase(*Ticket) bool
	IsNotPurchased(*Ticket) bool
}

// struct Play which implements interface Show's methods
type Play struct {
	name      string
	purchased []Ticket
	date      time.Time
}

func (p Play) GetName() string {
	return p.name
}

func (p Play) GetShowStart() time.Time {
	return p.date
}
func (p Play) GetShowEnd() time.Time {
	return p.date
}
func (p Play) AddPurchase(newTicket *Ticket) bool {
	for _, ticket := range p.purchased {
		if *newTicket == ticket {
			return false
		}
	}
	p.purchased = append(p.purchased, *newTicket)
	return true
}
func (p Play) IsNotPurchased(searchTicket *Ticket) bool {
	for _, ticket := range p.purchased {
		if *searchTicket == ticket {
			return false
		}
	}
	return true
}

// struct Ticket
type Ticket struct {
	customer string
	siege    *Seat
	show     *Show
}

// struct Seat
type Seat struct {
	number int32
	row    int32
}

// struct Theatre
type Theatre struct {
	allSeats    []Seat
	listOfShows []Show
}

// main function
func main() {
	theatre := Theatre{[]Seat{}, []Show{}}

	for i := 0; i < 5; i++ {
		for j := 1; j <= 25; j++ {
			theatre.allSeats = append(theatre.allSeats, Seat{int32(j), int32(i)})
		}
	}

	timeTartuffe := time.Date(2020, time.Month(3), 03, 22, 00, 00, 0, time.UTC)
	theatre.listOfShows = append(theatre.listOfShows, Play{"Tartuffe", []Ticket{}, timeTartuffe})

	timeMacbeth := time.Date(2020, time.Month(4), 10, 19, 00, 00, 0, time.UTC)
	theatre.listOfShows = append(theatre.listOfShows, Play{"Macbeth", []Ticket{}, timeMacbeth})

	for {
		name := ""
		piece := ""
		seatRow := -1
		seatNum := -1
		fmt.Print("Entrez votre nom : ")
		fmt.Scanln(&name)

		fmt.Print("\nSélectionnez une pièce : ")
		fmt.Scanln(&piece)

		fmt.Print("\nSélectionnez un numéro de rangée : ")
		fmt.Scanln(&seatRow)

		fmt.Print("\nSélectionnez un numéro de siège : ")
		fmt.Scanln(&seatNum)
		addSeatIfShowAndSeatIsAvailable(&theatre, piece, seatRow, seatNum)

	}
}

func addSeatIfShowAndSeatIsAvailable(t *Theatre, p string, seatRow int, seatNum int) bool {
	isValidShowName := false

	// check if the show exists or not
	for _, showName := range t.listOfShows {
		if p == showName.GetName() {
			isValidShowName = true
			break
		}
	}
	if !isValidShowName {
		fmt.Println("ERREUR : Cette pièce n'existe pas. SVP entrez le nom d'une autre pièce.")
		// print list of all shows here if you want
		return false
	}

	// check if the seat is available or not / if the ticket for this seat has been sold or not
	for _, seat := range t.allSeats {
		if int32(seatRow) == seat.row && int32(seatNum) == seat.number {
			fmt.Println("ERREUR : Cette siège est déjà occupé par quelqu'un d'autre. SVP entrez un autre rangée et numéro de siège.")
			return false
		}
	}

	// begin adding person to the seat and show
	newSeat := Seat{int32(seatNum), int32(seatRow)}
	t.allSeats = append(t.allSeats, newSeat)

	fmt.Println("SUCCÈS : Cette siège est disponible. Profitez du spectacle")
	return true
}
