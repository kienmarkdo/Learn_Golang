/*
Kien Do 300163370
CSI 2520 - Paradigmes de programmation
Laboratoire 1 - Go Basics
Exercice 4: Maps
*/

package main

import (
	"fmt"
)

// Define a suitable structure
type CourseInfo struct {
	NStudents int
	Professor string
	Avg       float64
}

func newCourseInfo(numStudents int, prof string, avg float64) *CourseInfo {
	newCourse := CourseInfo{NStudents: numStudents, Professor: prof, Avg: avg}
	return &newCourse
}

func main() {
	// Create a dynamic map m
	m := make(map[string]CourseInfo)

	// Add the courses CSI2120 and CSI2110 to the map
	m["CSI2120"] = *newCourseInfo(50, "Robert Laganiere", 99.99)
	m["CSI2110"] = CourseInfo{120, "Dorra Riahi", 50.55555}

	for k, v := range m {
		fmt.Printf("Course Code: %s\n", k)
		fmt.Printf("Number of students: %d\n", v.NStudents)
		fmt.Printf("Professor: %s\n", v.Professor)
		fmt.Printf("Average: %f\n\n", v.Avg)
	}
}
