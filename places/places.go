package places

// Places is a struct that contains a name and a location
type Places struct {
	Name     string
	Location string
}

// GetName returns the name of the Places
func (p *Places) GetName() string {
	return p.Name
}

// GetLocation returns the location of the Places
func (p *Places) GetLocation() string {
	return p.Location
}

// SetName sets the name of the Places
// name is a string that represents the name of the Places
func (p *Places) SetName(name string) {
	p.Name = name
}

// SetLocation sets the location of the Places
func (p *Places) SetLocation(location string) {
	p.Location = location
}
