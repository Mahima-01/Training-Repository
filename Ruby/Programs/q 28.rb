# 28 Given an array of integers nums, return the number of good pairs. 
#A pair (i, j) is called good if nums[i] == nums[j] and i < j. 

def good_pair(arr)
  arr_uniq = arr.uniq
  occurence = []
  no_of_good_pairs = 0
  arr_uniq.each { |a| occurence << arr.count(a) }
  occurence.each { |a| no_of_good_pairs += (a * (a - 1)) / 2; }
  no_of_good_pairs
end
array = [2, 3, 4, 5, 7,9, 3, 6, 5, 3, 20]
print good_pair(array), "\n"

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
4

