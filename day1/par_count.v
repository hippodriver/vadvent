import os

fn main() {
	mut counter := 0
	data := read_data_file('/homepool/mickraus/coding/v2/advent2015/day1/input.dat')
	for c in data.split("") {
		if c == "(" {
			counter++
		}
		if c == ")" {
			counter--
		}
	}
	println("Para Balance: $counter")
}

fn read_data_file(filename string) string {
	data := os.read_file(filename) or { panic(err) }
	return data
}
