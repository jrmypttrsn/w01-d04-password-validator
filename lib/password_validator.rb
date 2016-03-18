require "pry"

# 
# 
# 
# 
# 
# 
# 

def valid_password?(password)
  at_least_one_caps?(password) && 
  at_least_eight_characters?(password) &&
  at_least_one_lower_case?(password) &&
  at_least_one_na_character?(password) &&
  at_least_one_number? &&
  includes_phrase_password?
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

def includes_phrase_password?(password)
	password.include?("password")
	password.include?("Password")
	password.include?("pAssword")
	password.include?("paSsword")
	password.include?("pasSword")
	password.include?("passWord")
	password.include?("passwOrd")
	password.include?("passwoRd")
	password.include?("passworD")
	password.include?("PASSWORD")
end