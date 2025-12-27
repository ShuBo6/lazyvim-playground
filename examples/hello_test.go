package main

import "testing"

func TestAdd(t *testing.T) {
	tests := []struct {
		name     string
		a        int
		b        int
		expected int
	}{
		{"positive numbers", 2, 3, 5},
		{"negative numbers", -2, -3, -5},
		{"mixed numbers", -2, 3, 1},
		{"zero", 0, 0, 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := Add(tt.a, tt.b)
			if result != tt.expected {
				t.Errorf("Add(%d, %d) = %d; want %d", tt.a, tt.b, result, tt.expected)
			}
		})
	}
}

func TestPersonGreet(t *testing.T) {
	person := Person{
		Name: "Alice",
		Age:  30,
	}

	expected := "Hello, my name is Alice and I'm 30 years old."
	result := person.Greet()

	if result != expected {
		t.Errorf("Greet() = %q; want %q", result, expected)
	}
}
