# 4. Given an n-digit large number in form of string, check whether it is divisible by 7 or not.
def divisible_by_seven?(n)
  remainder_when_divided_by_seven = n % 7
  if remainder_when_divided_by_seven == 0
    return true
  else
    return false
  end
  
end
  
puts "7 divisible_by_seven? #{divisible_by_seven?(7)}"
puts "14 divisible_by_seven? #{divisible_by_seven?(14)}"
puts "21 divisible_by_seven? #{divisible_by_seven?(21)}"
puts "28 divisible_by_seven? #{divisible_by_seven?(28)}"
puts "35 divisible_by_seven? #{divisible_by_seven?(35)}"
puts "40 divisible_by_seven? #{divisible_by_seven?(40)}"

itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
7 divisible_by_seven? true
14 divisible_by_seven? true
21 divisible_by_seven? true
28 divisible_by_seven? true
35 divisible_by_seven? true
40 divisible_by_seven? false
