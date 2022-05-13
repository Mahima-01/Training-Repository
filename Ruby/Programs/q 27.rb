# 27. Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers. Return any array that satisfies this condition.

def even_then_odd(arr)
  transformed_arr = []
  (0...arr.size).each {|a| if arr[a].even? then transformed_arr << arr[a] end }
  (0...arr.size).each {|a| if arr[a].odd? then transformed_arr << arr[a] end }  
  transformed_arr
end

array = [1, 4, 6, 8, 5, 4, 6, 8, 5, 3, 2, 4, 50, 80, 9, 7, 5]
print even_then_odd(array) , "\n"

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
[4, 6, 8, 4, 6, 8, 2, 4, 50, 80, 1, 5, 5, 3, 9, 7, 5]
