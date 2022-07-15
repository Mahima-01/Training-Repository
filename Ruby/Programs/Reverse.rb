# Write a Ruby program to iterate an array starting from the last element.

nums = [10, 20, 30, 40, 10, 10, 20]
print "Original array:\n"
print nums

print "\nReverse array:\n"

nums.reverse.each { |x| puts x }

# Output:
itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Ruby/Programs$ ruby Reverse.rb
Original array:
[10, 20, 30, 40, 10, 10, 20]
Reverse array:
20
10
10
40
30
20
10

