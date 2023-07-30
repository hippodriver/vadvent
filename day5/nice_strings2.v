import os

fn read_input(filename string) []string {
	lines := os.read_lines(filename) or { panic(err) }
	return lines
}

fn main() {
	words := read_input('/homepool/mickraus/coding/v2/advent2015/day5/input2.dat')
	mut number_nice_strings := 0

	for word in words {
		if word.len < 3 {
			continue
		}
		mut has_tripple_char := false
		mut pairs:= []string{}
		mut contains_double_pair := false
		mut left := word[0].ascii_str()
		mut middle := word[1].ascii_str()
		pairs << "$left$middle"
		for c in word[2..] {
			right := c.ascii_str()
			if ("$left$middle" != "$middle$right") && pairs.contains("$middle$right") {
				contains_double_pair = true
			} else {
				pairs << "$middle$right"
			}
			if left == right {
				has_tripple_char = true
			}
			left = middle
			middle = right
		}
		println("string <$word> contains pairs <$pairs> and has tripple <$has_tripple_char> and has double pair <$contains_double_pair>")
		if has_tripple_char && contains_double_pair {
			number_nice_strings++
		}
	}

	println("Number of nice string found in input file: $number_nice_strings")
}