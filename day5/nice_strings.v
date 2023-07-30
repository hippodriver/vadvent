import os

const forbidden_pairs = ["ab", "cd", "pq", "xy"]

fn read_input(filename string) []string {
	lines := os.read_lines(filename) or { panic(err) }
	return lines
}

fn main() {
	words := read_input('/homepool/mickraus/coding/v2/advent2015/day5/input.dat')
	mut number_nice_strings := 0

	for word in words {
		if word.len < 3 {
			continue
		}
		mut number_of_vowels := 0
		mut has_pair_char := false
		mut has_forbidden_pair := false
		mut left := word[0].ascii_str()
		if "aeiou".contains(left) {
			number_of_vowels++
		}
		for c in word[1..] {
			right := c.ascii_str()
			if "aeiou".contains(right) {
				number_of_vowels++
			}
			if left == right {
				has_pair_char = true
			}
			pair := string("$left$right")
			if forbidden_pairs.contains(pair) {
				has_forbidden_pair = true
			}
			left = right
		}
		if (number_of_vowels >= 3) && has_pair_char && (!has_forbidden_pair) {
			number_nice_strings++
		}
	}

	println("Number of nice string found in input file: $number_nice_strings")
}