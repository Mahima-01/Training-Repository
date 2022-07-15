# Write a Ruby program to sort a given array of strings by length.

arr1 = ['abcde', 'abdf', 'adeab', 'abdgeee', 'abc', 'ab', 'a']
print "Original array:\n"
print arr1

print "\nSorted array of strings by length\n"

arr1 = arr1.sort_by(&:length)
print arr1

# Output:
itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Ruby/Programs$ ruby sorting.rb 
Original array:
["abcde", "abdf", "adeab", "abdgeee", "abc", "ab", "a"]
Sorted array of strings by length
["a", "ab", "abc", "abdf", "abcde", "adeab", "abdgeee"]
