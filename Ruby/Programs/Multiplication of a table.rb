# Ruby code to print multiplication table of a number:
puts 'Enter the number:'
num = gets.chomp.to_i
range = (1..10)
range.each { |e| print " \n #{num} * #{e} =", num * e }

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the number:
5
 
 5 * 1 =5 
 5 * 2 =10 
 5 * 3 =15 
 5 * 4 =20 
 5 * 5 =25 
 5 * 6 =30 
 5 * 7 =35 
 5 * 8 =40 
 5 * 9 =45 
 5 * 10 =50
