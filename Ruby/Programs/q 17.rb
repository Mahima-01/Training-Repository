# 17 Write a function which takes an integer (positive) and return an array of Fibonacci number of each index in index position till given number.

def fibonacci(num)
  if num.zero?
    return 0
  elsif num == 1
    return 1
  else
    return fibonacci(num - 1) + fibonacci(num - 2)
  end
end

def fib_array(array)
  fib_array = []
  array.each {|a| fib_array << fibonacci(a); print a,fibonacci(a)}
  fib_array
end

array = [1, 2, 3, 4, 5, 6, 7, 10, 11, 20, 30, 40]
print fib_array(array), "\n"


