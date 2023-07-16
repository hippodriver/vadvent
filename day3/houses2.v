import os

fn read_data_file(filename string) string {
	data := os.read_file(filename) or { panic(err) }
	return data
}

fn is_even(number int) bool {
	return number % 2 == 0
}

fn main() {
	data := read_data_file('/homepool/mickraus/coding/v2/advent2015/day3/input.dat')
	mut houses_visited := map[int]map[int]bool{}
	mut pos_santa_x := 0
	mut pos_santa_y := 0
	mut pos_robo_x := 0
	mut pos_robo_y := 0

	// start house
	houses_visited[pos_santa_x][pos_santa_y] = true
	
	// move from house to house and remember
	for i, move in data.split("") {
		match move {
			"^" { 
				if is_even(i) {
					pos_santa_y += 1
					houses_visited[pos_santa_x][pos_santa_y] = true
				} else {
					pos_robo_y += 1
					houses_visited[pos_robo_x][pos_robo_y] = true
				}
			
			 }
			">" { 
				if is_even(i) {
					pos_santa_x += 1
					houses_visited[pos_santa_x][pos_santa_y] = true
				} else {
					pos_robo_x += 1
					houses_visited[pos_robo_x][pos_robo_y] = true
				}
			 }
			"v" { 
				if is_even(i) {
					pos_santa_y -= 1
					houses_visited[pos_santa_x][pos_santa_y] = true
				} else {
					pos_robo_y -= 1
					houses_visited[pos_robo_x][pos_robo_y] = true
				}
				
			 }
			"<" { 
				if is_even(i) {
					pos_santa_x -= 1
					houses_visited[pos_santa_x][pos_santa_y] = true
				} else {
					pos_robo_x -= 1
					houses_visited[pos_robo_x][pos_robo_y] = true
				}
			 }
			else {}
		}
	}

	// count visited houses
	mut count := 0
	for _, columns in houses_visited {
		count += columns.keys().len
	}

	println("Number of visited houses: $count")

}