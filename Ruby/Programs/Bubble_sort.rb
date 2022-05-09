# Program to implement Bubble sort:
def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end
  array
end

a = bubble_sort([1, 19, 20, 35, 70, 12, 5, 30, 23, 10])
print a

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
[1, 5, 10, 12, 19, 20, 23, 30, 35, 70]

