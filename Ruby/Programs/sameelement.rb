# Write a Ruby program to check two given arrays of integers and test whether they have the same first element or they have the same last element. Both arrays length must be 1 or more.

def check_array(a, b)
   return (a[0] == b[0] || a[a.length-1] == b[b.length-1])
end

print check_array([1, 2, 5], [7, 5]),"\n" 

print check_array([1, 2, 3], [7, 3, 2]),"\n" 

print check_array([1, 2, 4], [1, 4]),"\n"

print check_array([1, 2, 8], [2, 4]) 

# Output:
itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Ruby/Programs$ ruby sameelement.rb 
true
false
true
false

