# Ruby program to demonstrate the downto() function:
The downto() function returns all the numbers less than equal to the number till the specified number.
num1 = 5
num2 = -5

num1.downto(1) { |i| print i, ' ' }

puts "\n"

num2.downto(-10) { |i| print i, ' ' }

OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
5 4 3 2 1 
-5 -6 -7 -8 -9 -10

num1 = 5
num2 = -5

num1.downto(0) { |i| print i, ' ' }

puts "\n"

num2.downto(-12) { |i| print i, ' ' }

OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
5 4 3 2 1 0 
-5 -6 -7 -8 -9 -10 -11 -12
