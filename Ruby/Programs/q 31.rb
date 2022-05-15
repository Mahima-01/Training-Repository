# 31. Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice. You can return the answer in any order.
class Sum
  def sum_target(array, target)
    hash = Hash.new
    (0...array.size).each { |index| hash[array[index]] = index }
    print hash
    (0...array.size).each {|index| 
      if hash[target - array[index]] and hash[target - array[index]] != index
        return [index, hash[target - array[index]]]
      end
    }
  end
end

max = Sum.new
array = [1, 2, 3, 4, 5, 5, 6, 7]
target = 13
print max.sum_target(array,target),"\n" 

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb 
{1=>0, 2=>1, 3=>2, 4=>3, 5=>5, 6=>6, 7=>7}[6, 7]
