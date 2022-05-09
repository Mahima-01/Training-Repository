# Program to Print Triangle of Numbers in Ruby:
array = (1..10).to_a

order = 1

limit = 4

(1..limit).each do |number|

array [order - 1, number].each{ |i| print "#{i} " } # will print it in line
order += number
puts # will print a break between your lines

end

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby/Ruby_Programs$ ruby Triangles\ of\ number.rb 
1 
2 3 
4 5 6 
7 8 9 10 

