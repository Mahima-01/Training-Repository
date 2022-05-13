15. Create a function that takes an array of numbers and returns a new array containing only prime numbers.

def is_prime(no)
  x = 0
  (2...no).each {|i| 
    if (no % i).zero?
     x += 1 
    end
    }
  if x == 0
    no
  end
end

def only_prime(array)
  prime = []
  array.each {|a| prime << is_prime(a)}
  prime.compact
end

array = [1, 2, 3, 4, 5, 6, 7, 20, 25, 40, 45, 48, 60, 90, 93, 97]
print only_prime(array) , "\n" 

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
[1, 2, 3, 5, 7, 97]
