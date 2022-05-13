# 23.  Given an array nums. We define a running sum of an array as running Sum[i] = sum( nums[0]...nums[i]). 
#Return the running sum of nums. 

def running_sum(arr)
  running_sum = []
  running_sum << arr[0]
  (1...arr.size).each { |a| running_sum << arr[0..a].sum }
  running_sum
end

array = [1, 2, 3, 4, 5, 6, 7, 10, 12, 18, 20, 22]
print running_sum(array), "\n"

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
[1, 3, 6, 10, 15, 21, 28, 38, 50, 68, 88, 110]

