# 9. Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.
def first_non_repeat_character(string)
  string.chars.find { |character| string.count(character) == 1 }
end
  first_non_repeat_character('teststring') # => "e"
  
module Non_repeating_char
  def Non_repeating_char.first_non_repeating_char(string)
    counter = 0
    (string.chars.uniq.sort).each { |char| 
      if string.count(char) == 1
        return string.index(char)
      end
	}
    return -1
  end
end
  string = "goodafternoon"
  print Non_repeating_char.first_non_repeating_char(string), "\n"
  
Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
4
