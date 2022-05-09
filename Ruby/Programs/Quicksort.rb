# Program to implement Quick sort:
def quick_sort(array, first, last)
  if first < last
    j = partition(array, first, last)
    quick_sort(array, first, j - 1)
    quick_sort(array, j + 1, last) 
  end
  return array
end

def partition(array, first, last)
  pivot = array[last]
  pIndex = first
  i = first
    while i < last
      if array[i].to_i <= pivot.to_i
        array[i], array[pIndex] = array[pIndex], array[i]
        pIndex += 1
      end
    i += 1
    end
    array[pIndex], array[last] = array[last], array[pIndex]
    return pIndex
end 
a = quick_sort([1, 19, 20, 35, 66, 12, 5, 30, 3, 10], 0, 9)
print a

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
[1, 3, 5, 10, 12, 19, 20, 30, 35, 66]
