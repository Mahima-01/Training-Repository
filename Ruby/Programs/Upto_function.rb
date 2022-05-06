# Ruby program to demonstrate the upto() function:
The upto() function returns all the numbers greater than equal to the number till the specified number.

num1 = 5
num2 = -5

num1.upto(10) { |i| print i, ' ' }

puts "\n"

num2.upto(1) { |i| print i, ' ' }

OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
5 6 7 8 9 10 
-5 -4 -3 -2 -1 0 1 
