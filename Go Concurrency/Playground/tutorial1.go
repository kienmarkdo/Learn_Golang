package main

import (
	"fmt"
	"os"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

// func main() {
// 	dat, err := os.ReadFile("pays.txt")
// 	check(err)
// 	fmt.Print(string(dat))
// }

func main() {
	file, err := os.Open("pays.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()
	var (
		nom        string
		population int
	)

	for {
		n, err := fmt.Fscan(file, &nom, &population)

		if err == nil {
			fmt.Println(n, nom, population)
		} else {
			break
		}
	}
}
