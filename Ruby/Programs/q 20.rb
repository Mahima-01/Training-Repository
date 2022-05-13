# 20.  Given an unsorted array Arr of size N of positive integers. One number 'A' from set {1, 2, ...N} is missing and one number 'B' occurs twice in array. Find these two numbers.
def missing_repeat(arr)
  missing = nil
  repeat = nil
  arr_uniq = arr.uniq.sort 
  a = 0
  while a < arr_uniq.size - 1
    if arr_uniq[a] != arr_uniq[a + 1] - 1 then missing = arr_uniq[a] + 1 end
    if arr.count(arr_uniq[a]) > 1 then repeat = arr_uniq[a] end
    a += 1 
  end
  print 'missing no is ', missing, ' repeat no is ', repeat, '\n'
end
arr = [10, 11, 12, 14, 15, 16, 14, 17, 18, 19, 20]
missing_repeat(arr)

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
missing no is 13 repeat no is 14.
