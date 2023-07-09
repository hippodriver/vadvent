import os

struct Present {
	length int
	width int
	height int
}

fn read_input(filename string) []Present {
	mut presents := []Present{}
	lines := os.read_lines(filename) or { panic(err) }
	for line in lines {
		dims := line.split("x")
		present := Present{ dims[0].int(), dims[1].int(), dims[2].int() }
		presents << present
	}

	return presents
}

fn smallest_length(a int, b int, c int) int {
	mut smallest := a
	if b < smallest {
		smallest = b
	}
	if c < smallest {
		smallest = c
	}
	return smallest
}

fn two_smallest_lengths(a int, b int, c int) (int, int) {
	mut r1 := 0
	mut r2 := 0

	if a <= b {
		r1 = a
		if b <= c {
			r2 = b
		} else {
			r2 = c
		}
	} else {
		r1 = b
		if a <= c {
			r2 = a
		} else {
			r2 = c
		}
	}
	return r1, r2
}

fn main() {
	presents := read_input('/homepool/mickraus/coding/v2/advent2015/day2/input.dat')

	// Calculate paper
	mut overall_size := 0
	for present in presents {
		area1 := present.length * present.width
		area2 := present.width * present.height
		area3 := present.height * present.length 

		extra := smallest_length(area1, area2, area3)
		surface_area := 2 * area1 + 2 * area2 + 2 * area3
		paper_size := surface_area + extra
		overall_size += paper_size
	}
	println("Overall paper size needed: $overall_size")

	// Calculate ribbon
	mut overall_ribbon := 0
	for present in presents {
		a, b := two_smallest_lengths(present.length, present.width, present.height)
		main_ribbon := 2 * (a + b)
		bow_ribbon := present.length * present.width * present.height
		overall_ribbon += main_ribbon + bow_ribbon
	}
	println("Overall ribbon length needed: $overall_ribbon")

}
