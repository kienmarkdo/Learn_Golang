package main

import "fmt"

type Tree struct {
	Left  *Tree
	Value int
	Right *Tree
}

func NewTree(v int) *Tree {

	return &Tree{nil, v, nil}
}

func (t *Tree) Insert(v int) *Tree {

	if v < t.Value {
		if t.Left == nil {
			t.Left = NewTree(v)
			return t.Left
		} else {
			return t.Left.Insert(v)
		}
	} else {
		if t.Right == nil {
			t.Right = NewTree(v)
			return t.Right
		} else {
			return t.Right.Insert(v)
		}

	}
}

func (t *Tree) getMax() int {
	if t == nil {
		return 0
	} else if t.Right == nil {
		return t.Value
	} else if t.Right != nil {
		return t.Right.getMax()
	}
	return 0
}

func main() {

	t := NewTree(5)

	t.Insert(7)
	t.Insert(9)
	t.Insert(2)
	t.Insert(8)
	t.Insert(5)

	fmt.Println(t.getMax())
}
