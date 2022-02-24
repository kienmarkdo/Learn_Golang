/*
Nom: Kien Do 300163370
CSI2520 Devoir 1 - Caesar Cipher

Question 3: [3 pts]

Afin d’accélérer le traitement, nous voulons maintenant subdiviser la liste originale de messages
en 3. Réécrire la fonction main en b) de façon à ce que 3 fonctions go concurrentes soient
appelées, chacune traitant un tier des données. Votre programme devrait fonctionner avec une
liste de n’importe quelle dimension sans avoir à modifier votre code (sauf pour ce qui est de
l’initialisation du tableau de messages).

To accelerate the processing, we would like to split the original list of messages into 3. Rewrite
the main function in b) such that 3 concurrent go function are created. Your program should
work for list of any size without having to modify the code (except the array initialization).
*/

package main

import (
	"bytes"
	"fmt"
	"strings"
	"unicode"
)

func main() {
	// List of messages
	messages := []string{"Csi2520", "Csi2120", "3 Paradigms",
		"Go is 1st", "Prolog is 2nd", "Scheme is 3rd",
		"uottawa.ca", "csi/elg/ceg/seg", "800 King Edward"}

	// Create channels
	size := len(messages)
	c := make(chan string, size)

	// call go funtion
	go CaesarCipherList(messages[:size/3], 2, c)           // process first 1/3 of messages
	go CaesarCipherList(messages[size/3:(size*2)/3], 2, c) // process second 1/3 of messages
	go CaesarCipherList(messages[(size*2)/3:], 2, c)       // process third 1/3 of messages

	// print results
	for range messages {
		fmt.Println(<-c)
	}

	// add synchronisation
}

/*
	Takes a list of messages and returns a list of encrypted messages.
*/
func CaesarCipherList(messages []string, shift int, c chan string) {
	for _, m := range messages {
		c <- CaesarCipher(m, shift)
	}
}

/*
	Takes a message and returns an encrypted message.
	Example:
		fmt.Println(CaesarCipher("I love CS!", 5))
		-> NQTAJHX
*/
func CaesarCipher(m string, shift int) string {

	var strCipher string    // final ciphered string
	var buffer bytes.Buffer // to be used later to convert from slice of unicode to string

	m = strings.ToUpper(m) // convert OG string to uppercase
	var r []rune           // slice of unicode chars

	// add all letter characters to the rune slice
	for _, c := range m {
		if unicode.IsLetter(c) {
			r = append(r, c) // add character to slice of unicode
		}
	}

	// begin shifting with the loop
	// NOTE: ASCII A = 65, Z = 90, and regular char index A = 0, Z = 25
	for _, c := range r {
		charIndex := int(c) - 65      // Example: F = 70 (ASCII), 70 - 65 = 5 (regular char index where A = 0, Z = 25)
		charIndex = charIndex + shift // shift
		charIndex = charIndex % 26    // modulo so that we get the correct regular char index from 0 to 25

		c = rune(65 + charIndex) // convert regular char index back to ASCII

		buffer.WriteRune(c) // write the rune character to a string with bytes.Buffer
	}

	strCipher = buffer.String()

	return strCipher
}
