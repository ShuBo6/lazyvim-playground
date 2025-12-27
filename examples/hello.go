package main

import "fmt"

// Person represents a person with basic information
type Person struct {
	Name string
	Age  int
}

// Greet returns a greeting message
func (p Person) Greet() string {
	return fmt.Sprintf("Hello, my name is %s and I'm %d years old.", p.Name, p.Age)
}

// Add adds two numbers and returns the result
func Add(a, b int) int {
	return a + b
}

func main() {
	// Create a person
	person := Person{
		Name: "Shubo",
		Age:  25,
	}

	// Print greeting
	fmt.Println(person.Greet())

	// Test addition
	result := Add(5, 3)
	fmt.Printf("5 + 3 = %d\n", result)
}
