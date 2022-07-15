# Write a Ruby program to split a delimited string into an array.
# A delimiter is one or more characters that separate text strings. Common delimiters are commas (,), semicolon (;), quotes ( ", ' ), braces ({}), pipes (|), or slashes ( / \ ). 
#When a program stores sequential or tabular data, it delimits each item of data with a predefined character.
#An example of a delimiter is the comma character, which acts as a field delimiter in a sequence of comma-separated values.

color = "Red, Green, Blue, White"
nums = "1, 3, 4, 5, 7"

print "Original delimited string:\n"

print color,", "

print nums

print "\nString to array:\n"

color_array = color.split(",")
nums_array = nums.split(",").map { |s| s.to_i }

print color_array

print "\n",nums_array

# Output:
itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Ruby/Programs$ ruby delimited.rb 
Original delimited string:
Red, Green, Blue, White, 1, 3, 4, 5, 7
String to array:
["Red", " Green", " Blue", " White"]
[1, 3, 4, 5, 7]
