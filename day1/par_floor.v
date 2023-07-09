import os

fn main() {
	mut counter := 0
	data := read_data_file('/homepool/mickraus/coding/v2/advent2015/day1/input.dat')
	for i, c in data.split("") {
		if c == "(" {
			counter++
		}
		if c == ")" {
			counter--
		}
		if counter == -1 {
			println("Input position first entering basement: ${i+1}")
			return
		}
	}
	println("Never reached the basement")
}

fn read_data_file(filename string) string {
	data := os.read_file(filename) or { panic(err) }
	return data
}
