# Program to find armstrong Number:
puts 'Enter the number'
num = gets.chomp.to_i
temp = num
sum = 0
while num != 0
  rem = num % 10
  num /= 10
  sum += rem * rem * rem
end
if temp == sum 
  puts "The #{temp} is Armstrong"
else
  puts "The #{temp} is not Armstrong"
end

OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the number
153
The 153 is Armstrong
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the number
216
The 216 is not Armstrong
