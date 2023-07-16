import crypto.md5

const secret = "bgvyzdsv"

fn start_with_5_zeros(s string) bool {
	if s.len < 5 {
		return false
	}
	return s[0..5] == "00000"
}

fn start_with_6_zeros(s string) bool {
	if s.len < 6 {
		return false
	}
	return s[0..6] == "000000"
}

fn main() {
	for i in 1..10_000_000 {
		value := secret + i.str()
		hash := md5.hexhash(value)
		if start_with_5_zeros(hash) {
			println("Suffix found with five zeros: ${i.str()}")
		}
		if start_with_6_zeros(hash) {
			println("Suffix found with six zeros: ${i.str()}")
			exit(0)
		}
	}
	println("No sufficient suffix found")
}
