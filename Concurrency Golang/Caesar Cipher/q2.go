/*
Nom: Kien Do 300163370
CSI2520 Devoir 1 - Caesar Cipher

Question 2: [3 pts]

Définir un programme Go traitant une liste de messages en utilisant une fonction concurrente. La
fonction main de ce programme passe la liste des messages à une fonction go qui encrypte
chacun des messages et envoie ces messages codés à un channel. La fonction main affiche
simplement les messages encryptés dans l’ordre ou ils sont reçus.

Write a Go program that processes a list of messages using a concurrent function. A main
function passes the list of messages to a go function that encrypts each message and send each
resulting encrypted message to a channel. The main function simply prints the encrypted
messages as they are received, in any order.

Le résultat produit devrait être comme suit :
The result will look as follows:

EUK
EUK
RCTCFKIOU
IQKUUV
RTQNQIKUPF
UEJGOGKUTF
WQVVCYCEC
EUKGNIEGIUGI
MKPIGFYCTF
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
	c := make(chan string, len(messages))

	// call go funtion
	go CaesarCipherList(messages[:], 2, c) // send channels

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
