# Program to find Factorial of a number:

puts "Enter the number:"
num=gets.chomp.to_i

fact=1
if (num==0)
    puts "Error! Could not find the factorial of one"
else
    i=1
    while(i<=num)
        fact=fact*i
        i+=1
    end
end
        puts "factorial of #{num} is #{fact}"


Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the number:
5
factorial of 5 is 120
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the number:
10
factorial of 10 is 3628800
