import os

enum Operation {
	on
	off
	toggle
}

struct Instruction {
	op Operation
	x_start int
	x_end int
	y_start int
	y_end int
}

fn read_input(filename string) []Instruction {
	mut instructions := []Instruction{}
	lines := os.read_lines(filename) or { panic(err) }
	for _, line in lines {
		tokens := line.split(" ")
		mut op := Operation.on
		mut x_start := 0
		mut x_end := 0
		mut y_start := 0
		mut y_end := 0
		mut pos := 0
		if tokens[pos] == "toggle" {
			op = Operation.toggle
		} else {
			pos++
			if tokens[pos] == "on" {
				op = Operation.on
			} else {
				op = Operation.off
			}
		}
		pos++
		first := tokens[pos].split(",")
		pos++
		x_start = first[0].int()
		y_start = first[1].int()
		pos++
		second := tokens[pos].split(",")
		pos++
		x_end = second[0].int()
		y_end = second[1].int()

		instructions << Instruction{op: op, x_start: x_start, y_start: y_start, x_end: x_end, y_end: y_end}
	}

	return instructions
}

fn update_grid(mut grid [][]bool, ins Instruction) {
	for i in ins.x_start .. ins.x_end+1 {
		for j in ins.y_start .. ins.y_end+1 {
			match ins.op {
				.on { grid[i][j] = true }
				.off { grid[i][j] = false }
				.toggle { grid[i][j] = !grid[i][j] }
			}
		}
	}
}

fn count_grid(grid [][]bool) int {
	mut counter := 0
	for row in grid {
		for field in row {
			if field {
				counter++
			}
		}
	}
	return counter
}

fn main() {
	instructions := read_input('/homepool/mickraus/coding/v2/advent2015/day6/input.dat')
	println("Loaded intructions: $instructions")
	mut grid := [][]bool{len: 1000, init: []bool{len: 1000}}
	for ins in instructions {
		update_grid(mut grid, ins)
	}
	count := count_grid(grid)
	println("Number of houses lit: $count")
}