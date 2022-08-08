# 2. Write a function to return reverse of a string using recursion.

def reverse_recursion (string)
  if string.length <= 1 then 
    return string;
  end

  last = string[-1];
  string = string[0...-1];
  string = reverse_recursion(string);
  last + string;
end

string = "hello reverse"
print reverse_recursion(string) , "\n";

#itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
#esrever olleh


=begin
def reverse(num,rev)
  if num > 0 
    rem = (num % 10);
    rev = rev*10+rem;
    reverse(num / 10,rev);
  else
    return rev;    
  end
end

print "Enter number: ";
number = gets.chomp.to_i;  

result = reverse(number, 0);
print "Result is: ",result;
=end


