print "Enter Number for Rows", ": "

rows = gets.chomp.to_i

for row in 0..rows
  (rows-row).times { print " " }
  row.times { print "*" }
  (row-1).times { print "*" }
  puts
end

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby/Ruby_Programs$ ruby pyramid.rb 
Enter Number for Rows: 6
      
     *
    ***
   *****
  *******
 *********
***********

