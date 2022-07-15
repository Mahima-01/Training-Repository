# Write a Ruby program to find most occurred item in a given array.

nums = [10, 20, 30, 40, 10, 10, 20]

print "Original array:\n"
print nums

nums_freq = nums.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

print "\nFrequency of numbers:\n"
print nums_freq

# Output:
itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Ruby/Programs$ ruby frequency.rb 
Original array:
[10, 20, 30, 40, 10, 10, 20]
Frequency of numbers:
{10=>3, 20=>2, 30=>1, 40=>1}
