# . Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product. Elements can also be negative numbers. 
#Input: nums = [2,3,-2,4] 
#Output: 6 
#Explanation: [2,3] has the largest product 6.

def sub_array_max_product(nums)
  first_index = 0
  last_index = 1
  max_product = nums[0]
  for i in 0...nums.size
    product = 1
    for j in i...nums.size
      product *= nums[j]
      if product > max_product
        first_index = i
        last_index = j
        max_product = product
      end
    end
  end
  print "\n", max_product, "\n"
  max_product
end
nums = [1, 2, -1, -2, 3, 5, 6, -6, -7, 8, 10, -10]
sub_array_max_product(nums)

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
6048000
