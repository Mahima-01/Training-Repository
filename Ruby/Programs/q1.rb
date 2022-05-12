STRINGS ASSIGNMENT:

1. Create a function that takes an array of strings and integers, and filters out the array so that it returns an 
array of integers only.
array = [1, 2, 'a', 'b']
array.select { |element| element.is_a?(Integer) }
print array

Output:
3.0.0 :270 > array = [1, 2, 'a', 'b']
 => [1, 2, "a", "b"] 
3.0.0 :271 > array.select { |element| element.is_a?(Integer) }
 => [1, 2] 


