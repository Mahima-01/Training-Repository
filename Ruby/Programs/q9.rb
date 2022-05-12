# 9. Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.
def first_non_repeat_character(string)
  string.chars.find { |character| string.count(character) == 1 }
end
  first_non_repeat_character('teststring') # => "e"
