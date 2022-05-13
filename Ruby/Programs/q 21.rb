# 21 Write a function that takes an integer (less than 1000) and return an array of primes till that number.
def prime(num)
  i = 2
  count = 0
  if num == 2
    return 2
  end
  loop do
    if (num % i).zero?
      count = 1
    end
    i += 1
    break if i == (num)
  end

  if count.zero?
    num
  end
end

def prime_array(num)
  prime_arr = []
  (2..num).each { |a| prime_arr << prime(a);}
  prime_arr.compact
end

print 'Enter no below which prime number is to be found : '
no = gets.to_i
print prime_array(no), "\n"

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
Enter no below which prime number is to be found : 50
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]

