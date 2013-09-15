# Checks if the string passed to it is a palindrome
# by taking out everything but the characters of the
# string to compare it's reverse (case insensitive)
#
# @str String contains the palindrome in question
def palindrome?(str)
	!!(str.gsub(/[^a-z]/i, "").casecmp(str.gsub(/[^a-z]/i, "").reverse) == 0)
end

# Converts the string to a string of words, meaning anything
# that isn't a letter is removed except whitespace. The string
# is then downcased and split into an array. This array is then
# hashed and returned in word=>key, count=>value pairings.
#
# @str String contains the string to be counted and hashed
# return Hash holds word=>key, count=>value pairs
def count_words(str)
	str.gsub!(/[\b[^a-zA-Z ]]/, '')
	arr = str.downcase.split
	hash = Hash.new(0)
	arr.each { |name| hash[name] += 1 }
	return hash
end