3.Ruby code to check whether a number is prime or not:
puts "Enter the number:"
num=gets.chomp.to_i
count=0
if (num==0)
	puts "0 is not prime"
else
	i=2
	while(i<num)
		if (num%i==0)
			count+=1
		end
		i+=1
	end
	
end
	if count>1
		puts "#{num} is not a prime number"
	else
		puts "#{num} is a prime number"
	end
	
OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the number:
25
25 is a prime number
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the number:
40
40 is not a prime number
