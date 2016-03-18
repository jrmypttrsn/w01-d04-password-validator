require "pry"

def valid_password?(password)
  at_least_one_caps?(password) && 
  at_least_eight_characters?(password) &&
  at_least_one_lower_case?(password)
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
	password.include?("\W")
end

def at_least_one_number?(password)
	password.include?("0..9")	
end