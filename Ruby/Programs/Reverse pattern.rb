print "Enter Number for Rows", ": "

rows = gets.chomp.to_i

for row in 0..rows
  (rows-row).times { print "*" }
  puts
end

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby/Ruby_Programs$ ruby Reverse\ pattern.rb 
Enter Number for Rows: 5
*****
****
***
**
*

