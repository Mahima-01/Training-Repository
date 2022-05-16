# 11 Return the string that represents the kth largest integer in nums.
def kth_largest(nums, k)
  array_int = []
  nums.each { |string| array_int << string.to_i }
  array_int.sort!{ |a, b| b <=> a }
  return array_int[k - 1].to_s
end
