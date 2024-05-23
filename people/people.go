package people

// People is a struct that contains a name and an age
type People struct {
	Name string
	Age  int
}

// GetName returns the name of the People
func (p *People) GetName() string {
	return p.Name
}

// GetAge returns the age of the People
func (p *People) GetAge() int {
	return p.Age
}

// SetName sets the name of the People
func (p *People) SetName(name string) {
	p.Name = name
}

// SetAge sets the age of the People
// Test doc
func (p *People) SetAge(age int) {
	p.Age = age
}
