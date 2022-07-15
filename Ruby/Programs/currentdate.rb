# Write a Ruby program to display the current date and time.

require 'date'
current_time = DateTime.now
cdt = current_time.strftime "%d/%m/%Y %H:%M"

puts "Current Date and Time: "+cdt

# Output:
itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Ruby/Programs$ ruby currentdate.rb 
Current Date and Time: 15/07/2022 19:00

