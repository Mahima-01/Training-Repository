# map
Useful for creating an array out of an enumerable and applying certain logic for each element.

For example, squaring each value in an array of numbers. So, instead of using each to iterate and insert the result to another array, you can just use map.
=begin
def build_array(nums)
  result = []
  nums.each do |num|
    result << calculate(num)
  end
  result
end

# better: You can just use map
def build_array(nums)
  result = nums.map { |num| calculate(num) }
end

# best: Or even shorter.
def build_array(nums)
  result = nums.map(&:calculate)
end
=end

# each_with_object
#Useful for creating an object by iterating over an enumerable.
#For example, what if we wanted to produce a hash from an array? Or a Person object from a given hash?
#You could also use the reduce method, but I find its syntax confusing, so I prefer each_with_object.
def build_hash(nums)
  # it receives the object to start with ({}) and accumulates on top of it
  nums.each_with_object({}) { |num, res| res[num] = (num) }
end
# bonus: works with any kind of object
def build_array(nums)
  # the accumulator can be an array, or any object really.
  nums.each_with_object([]) { |num, res| res << (num) }
end

nums= [1, 4, 9, 16, 25, 16, 9, 4, 1]
print build_hash(nums), "\n"
print build_array(nums), "\n"

#output
#{1=>1, 4=>4, 9=>9, 16=>16, 25=>25}
#[1, 4, 9, 16, 25, 16, 9, 4, 1] 
