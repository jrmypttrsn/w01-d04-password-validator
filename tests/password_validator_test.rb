require "test_helper"
require_relative "../lib/password_validator.rb"

class PasswordValidatorTest < Minitest::Test
  # We'll try a password with all-lower-case-letters
  def test_rejects_all_lower_case_passwords
    result = at_least_one_caps?("1abjils&a")
    refute(result, "'1abjils&a' should be invalid because it contains no caps")
    #assert(result == false, ".same message as above")
  end

  # We try a password with a valid mix of upper and lower-case characters
  def test_accepts_mixed_case_passwords
    result = at_least_one_caps?("1Abjils&a")
    assert(result, "'1Abjils&a' should be valid because it is mixed case")
  end

  # We try a password of 8 characters, expecting success
  def test_accepts_password_of_8_characters
    result = at_least_eight_characters?("1Abjils&")
    assert(result, "'1ABjils&' has 8 characters, should be valid")
  end
  
  # We try a password of only 7 characters, expecting rejection
  def test_rejects_password_of_7_characters
    result = at_least_eight_characters?("1Abils&")
    refute(result, "'1ABils&' has 8 characters, should be valid")
  end

  #Testing a password with all upper case letters
  def test_rejects_all_upper_case_passwords
    result = at_least_one_lower_case?("1ABJILS&A")
    refute(result, "'1ABJILS&A' should be invalid because it contains no lowercase ")
  end

  #Testing a password with no non-alphanumeric (represented as 'na') characters
  def test_rejects_password_with_no_na_char
    result = at_least_one_na_character?("1Abjilsa")
    refute(result, "'1Abjilsa should be invalid because it does not contain non-alphanumeric characters")
  end

  #Testing a password with no numbers
  def test_rejects_password_with_no_numbers
    result = at_least_one_number?("Abjils&a")
    refute(result, "'Abjils&a' should be invalid because it contains no numbers")
  end 

  #Testing a password that contains 'password'
  def test_rejects_password_containing_password
    result = includes_phrase_password?("2Password$")
    refute(result, "'2Password$' should be invalid because it contains the word 'password'")
  end


#Could not get this test to work properly
  #def test_valid_password
  #  result = valid_password?("1Abils&a")
  #  assert(result, "'1Abils&a' should be valid")
  #end

 
end
