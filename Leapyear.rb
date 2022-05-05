6.Program to check leap year:
puts "Enter the year you want to check"
yr = gets.chomp.to_i

if yr % 4== 0
	puts "#{yr} is a leap year"
elsif yr % 4 == 0 && yr % 100 !=0
	puts "#{yr} is a leap year"
else
	puts "#{yr} is not a leap year"
end

OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the year you want to check
2024
2024 is a leap year
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the year you want to check
1997
1997 is not a leap year
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the year you want to check
2030
2030 is not a leap year
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the year you want to check
2000
2000 is a leap year

