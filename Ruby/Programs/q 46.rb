# 46 Given the parameter day, month and year, return whether date is a valid date.
require 'date'

def is_valid_date(day, month, year)
  begin
    date = Date.strptime("#{day} #{month} #{year}","%d %m %Y")
  rescue Exception => e
    puts e.message
    false
  else
    puts "Correct Date"
  end
end

print "Enter the Date to see if its a valid date\n Day : "
day = gets
print "\n Month : "
month = gets
print "\n Year : "
year = gets

is_valid_date(day, month, year)

Output:
Itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
Enter the Date to see if its a valid date
 Day : 50

 Month : 10

 Year : 2020
invalid date

itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
Enter the Date to see if its a valid date
 Day : 10

 Month : 10

 Year : 2018
Correct Date
