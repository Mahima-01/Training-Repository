# Program to implement merge sort:
def mergesort(array)
  return array if array.length == 1
  middle = array.length / 2
  merge mergesort(array[0...middle]), mergesort(array[middle..-1])
end

def merge(left, right)
  result = []
  until left.length.zero? || right.length.zero? do
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end
a = mergesort([1, 19, 20, 35, 66, 12, 5, 30, 3, 10])
print a

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby/Ruby_Programs$ ruby Merge\ sort.rb 
[1, 3, 5, 10, 12, 19, 20, 30, 35, 66]
