require "pry"

# Runs all methods to verify a password
# 
# password - a string representing the password that will be verified
# 
# returns true if password meets all requirements, otherwise returns false
# 
# 

def valid_password?(password)
  at_least_one_caps?(password) && 
  at_least_eight_characters?(password) &&
  at_least_one_lower_case?(password) &&
  at_least_one_na_character?(password) &&
  at_least_one_number?(password) &&
  includes_phrase_password?(password)
end

# Takes a string
# Returns true or false depending on if the string has at least one capital
# letter
def at_least_one_caps?(password)
  password != password.downcase
end

def at_least_eight_characters?(password)
  password.length >= 8
end

def at_least_one_lower_case?(password)
	password != password.upcase	
end

#'na' means non-alphanumeric
def at_least_one_na_character?(password)
	characters = password.gsub(/[A-Za-z0-9]/,"")
  characters.length != 0
end

def at_least_one_number?(password)
	password = password.include?("0..9")	
end

def includes_phrase_password?(password)
	!password.downcase.include?("password")
end

#valid_password?("1Abjils&A")