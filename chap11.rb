# chap 11 - Regular Expressions


=begin
puts "Match!" if /abc/.match("alphabets starts with abc.")
puts "Match!" if "alphabet starts with abc.".match(/abc/)
# string version of match, 2nd option above, coverts the string arg to a regexp

# in addition to match method, there is pattern matching operator "=~" equal+tilde
puts "match" if /abc/ =~ "alphabet starts with abc."
puts "match" if "alphabet starts with abc." =~ (/abc/)

# if there is a match
# =~ (match) operator returns the numerical index of the char in the string where the match started
# match method returns an instance of the class MatchData

puts "alphabet starts with abc." =~ (/abc/)  #  returns 21, index where abc starts in our string
puts /abc/ =~ "alphabet starts with abc."    # returns 21

puts /abc/.match("alphabets starts with abc.")  # returns "abc"
puts "alphabet starts with abc.".match(/abc/)   # returns "abc"
# in above 2 using match method, MatchData object is created


puts /a/.match("abc")
puts /a/ =~ ("abc")

p /d/.match("abc")  # returns nil
p /d/ =~ ("abc")    # returns nil

## special characters have to be escaped with a \ backslash
## backslash means treat as itself, not as special character
## they are:  ^ $ ? . / \ {} [] () + *

# the . dot is a wild card operator

puts "match" if /.bc/.match("alphas start with abc")  # returns "match"


# character class is explicit list of chars placed inside regexp square brackets []

puts "match-1" if /[dr]ejected/.match("dejected")  # returns "match-1"
puts "match-2" if /[dr]ejected/.match("rejected")  # returns "match-2"
p  /[dr]ejected/.match("ejected")   # since no match nil returned and printed

puts "match-4" if /[a-z]/.match("alpha")  # returns "match-4"
puts "match-5" if  /[a-z]/.match("9nine") # returns "match-5"
#  example of above skips the 9 and matched the "n" returning a MatchData object of "n"
#  have to add other qualifiers if we only want to search the first postion

# you use the ^ carat "negate" the regexp
# use to match any character except those on special list

string = "ABCabc123 is a hot mess"
p string =~ /[^A-Za-z0-9]/  # returns 9, position of first blank space
# with carat at beginning this says anything other that letter or number so
# position of space is what's returned
=end

##  there are special escape sequences for common character classes
##  /\d/ -->  matches any digit
##  /\D/ --> negated from of above, matches anything but a digit
##
##  /\w/ --> matches any digit, alpha char or underscore(_)
##  /\W/ --> matches anything but an alphanumeric char or underscore
##
##  /\s/ --> matches any whitespace char: space, tab, or newline
##  /\S/ --> matches any non white space character

p /\d/.match("123")  # returns <MatchData "1">
p /\D/.match("123")  # returns nil

p /\w/.match("abc")  # returns <MatchData "a">
p /\W/.match("abc")  # returns nil
p /\W/.match("   ")  # returns <MatchData " ">
p /\W/.match("@$@")  # returns <MatchData "@">
# /\W/ matches anything but alphanumerics so last two above return a match

p /\s/.match("   ")  # returns <MatchData " ">
p /\S/.match("   ")  # returns nil


