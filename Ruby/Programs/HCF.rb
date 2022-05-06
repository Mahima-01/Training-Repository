# Ruby programn to find HCF of two numbers:
tmp = 0

puts 'Enter number1:'
num1 = gets.chomp.to_i
puts 'Enter number2:'
num2 = gets.chomp.to_i
while num2 != 0
  tmp = num1 % num2
  num1 = num2
  num2 = tmp
end
puts 'Highest Common Factor is: ', num1

OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter number1: 
35
Enter number2: 
56
Highest Common Factor is: 
7

itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter number1: 
12
Enter number2: 
18
Highest Common Factor is: 
6
