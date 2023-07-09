import os

fn read_data_file(filename string) string {
	data := os.read_file(filename) or { panic(err) }
	return data
}

fn main() {
	data := read_data_file('/homepool/mickraus/coding/v2/advent2015/day3/input.dat')
	mut houses_visited := map[int]map[int]bool{}
	mut pos_x := 0
	mut pos_y := 0

	// start house
	houses_visited[pos_x][pos_y] = true
	
	// move from house to house and remember
	for move in data.split("") {
		match move {
			"^" { 
				pos_y += 1
				houses_visited[pos_x][pos_y] = true
			 }
			">" { 
				pos_x += 1
				houses_visited[pos_x][pos_y] = true
			 }
			"v" { 
				pos_y -= 1
				houses_visited[pos_x][pos_y] = true
			 }
			"<" { 
				pos_x -= 1
				houses_visited[pos_x][pos_y] = true
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