/*
Nom: Kien Do 300163370
CSI2520 Devoir 1 - Caesar Cipher

Question 1: [2 pts]

Définir la fonction CaesarCipher(m string, shift int) string qui accepte un
message et retourne le message encrypté.

Write the CaesarCipher(m string, shift int) string function that accepts a
message and returns the encrypted message.
*/

package main

import (
	"bytes"
	"fmt"
	"strings"
	"unicode"
)

func main() {
	fmt.Println(CaesarCipher("I love CS!", 5))                  // Retourne: NQTAJHX
	fmt.Println(CaesarCipher("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 23)) // Retourne: XYZABCDEFGHIJKLMNOPQRSTUVW
	fmt.Println(CaesarCipher("ATTACKATONCE", 4))                // Retourne: EXXEGOEXSRGI
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
