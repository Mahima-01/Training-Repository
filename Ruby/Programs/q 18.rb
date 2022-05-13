18. Write a function which takes an array of integers, return how many of them contain an even number of digits.

def no_even_digits(array)
  no_of_even_digits = 0
  array.each {|a| if a.to_s.size.even? then no_of_even_digits += 1 end }
    no_of_even_digits
end

array = [1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 19, 17, 23, 37,422,6775,86785,50645609,5986]
print no_even_digits(array) , "\n"

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
12
