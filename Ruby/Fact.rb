# Ruby program to calculate the factorial 
# using the recursion

def factorial(num)
	if num == 1 
		return 1;
	else 
		return num * factorial(num-1);
	end
end

print "Enter number: ";
num = gets.chomp.to_i;  

fact = factorial(num);

print "Factorial is: ",fact;
