$LOAD_PATH << '.'
require "week_module.rb"
class Decade
include Week
   no_of_yrs = 10
   def no_of_months
      puts Week::FIRST_DAY
      number = 10*12
      puts number
   end
end
d1 = Decade.new
puts Week::FIRST_DAY
Week.weeks_in_month
Week.weeks_in_year
d1.no_of_months

itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Weeks.rb 
Sunday
You have four weeks in a month
You have 52 weeks in a year
Sunday
120

