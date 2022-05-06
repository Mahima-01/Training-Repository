# Ruby Program to find LCM:
x = 0
y = 0

puts 'Enter number1:'
num1 = gets.chomp.to_i

puts 'Enter number2:'
num2 = gets.chomp.to_i

if num1 > num2
  x = num1
  y = num2
else
  x = num2
  y = num1
end

rem = x % y

while rem != 0
  x = y
  y = rem
  rem = x % y
end

lcm = num1 * num2 / y

puts 'Lowest Common Multiple is:', lcm

OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter number1: 
48
Enter number2: 
60
Lowest Common Multiple is: 240
