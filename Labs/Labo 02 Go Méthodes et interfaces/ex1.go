/*
Kien Do 300163370
CSI2520 - Laboratoire 02 Méthodes et interfaces en Go

Exercice 1 : Arbre binaire
*/

package main

import (
	"fmt"
)

type Point struct {
	x int
	y int
}
type PtTree struct {
	pt          Point
	left, right *PtTree
}

// func (bt *PtTree) printPostOrder(root *PtTree) {
// 	if root != nil {
// 		bt.printPostOrder(root.left)
// 		bt.printPostOrder(root.right)
// 		fmt.Printf("(%d, %d)", root.pt.x, root.pt.y)
// 	}
// }

// func (bt *PtTree) exists(root *PtTree, inputPoint Point) {
// 	if root == nil {
// 		return
// 	}
// 	if root.pt != inputPoint {
// 		bt.exists(root.left, inputPoint)
// 		bt.exists(root.right, inputPoint)
// 	}
// 	if root.pt == inputPoint {
// 		fmt.Printf("The point (%d, %d) exists in this tree!", root.pt.x, root.pt.y)
// 		return
// 	}
// }

// // main
// func main() {
// 	part_i()
// 	part_ii()
// }

// // different parts
// func part_i() {
// 	fmt.Println("====================== Partie 1 =====================")
// 	root := &PtTree{Point{1, 1}, nil, nil}
// 	root.left = &PtTree{Point{2, 2}, nil, nil}
// 	root.right = &PtTree{Point{3, 3}, nil, nil}
// 	root.left.left = &PtTree{Point{4, 4}, nil, nil}
// 	root.left.right = &PtTree{Point{5, 5}, nil, nil}
// 	root.right.left = &PtTree{Point{6, 6}, nil, nil}
// 	root.right.right = &PtTree{Point{7, 7}, nil, nil}

// 	root.printPostOrder(root)
// 	fmt.Println("\n\n")
// }

// func part_ii() {
// 	fmt.Println("====================== Partie 2 ======================")
// 	root := &PtTree{Point{1, 1}, nil, nil}
// 	root.left = &PtTree{Point{2, 2}, nil, nil}
// 	root.right = &PtTree{Point{3, 3}, nil, nil}
// 	root.left.left = &PtTree{Point{4, 4}, nil, nil}
// 	root.left.right = &PtTree{Point{5, 5}, nil, nil}
// 	root.right.left = &PtTree{Point{6, 6}, nil, nil}
// 	root.right.right = &PtTree{Point{7, 7}, nil, nil}

// 	root.exists(root, Point{3, 3})
// 	root.exists(root, Point{11, 11})
// 	fmt.Println("\n\n")
// }

func (bt *PtTree) postOrder() {
	if bt != nil {
		bt.left.postOrder()
		bt.right.postOrder()
		fmt.Printf("(%d, %d)", bt.pt.x, bt.pt.y)
	}
}

func (bt *PtTree) find(x int, y int) bool {
	if bt == nil {
		return false
	}
	if bt.pt.x == x && bt.pt.y == y {
		return true
	}
	if bt.left.find(x, y) {
		return true
	}
	return bt.right.find(x, y)

}

func main() {
	tree := PtTree{Point{2, 3},
		&PtTree{Point{5, 1},
			&PtTree{Point{2, 2}, nil, nil},
			&PtTree{Point{8, 3}, &PtTree{Point{1, 6}, nil, nil}, nil}},
		&PtTree{Point{4, 7},
			&PtTree{Point{7, 2},
				&PtTree{Point{6, 4}, nil, nil},
				&PtTree{Point{0, 9}, nil, nil}},
			&PtTree{Point{3, 6}, nil, nil}}}
	tree.postOrder()
	fmt.Println("")
	u, v := 7, 2
	if tree.find(u, v) {
		fmt.Printf("Found: %d %d \n", u, v)
	} else {
		fmt.Printf("Not Found\n")
	}
	x, y := 8, 6
	if tree.find(x, y) {
		fmt.Printf("Found: %d %d \n", u, v)
	} else {
		fmt.Printf("Not Found\n")
	}
}
