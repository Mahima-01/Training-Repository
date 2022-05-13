14. Write a function which takes an integer (positive) and return an array of factorials of each index in index 
def factorial(no)
  x = 1
  (1..no).each {|i| x *= i }
  print "Factorial of #{no} is #{x} \n"
end

def array_factorial(array)
  array.each {|a| factorial(a)}
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array_factorial(array)

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
Factorial of 1 is 1 
Factorial of 2 is 2 
Factorial of 3 is 6 
Factorial of 4 is 24 
Factorial of 5 is 120 
Factorial of 6 is 720 
Factorial of 7 is 5040 
Factorial of 8 is 40320 
Factorial of 9 is 362880 
Factorial of 10 is 3628800 

