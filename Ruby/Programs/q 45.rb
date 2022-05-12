# 45.Given a range of years as a string, return the number of leap years there are within the range (inclusive).
require 'rspec'
require 'date'

years = (1900..2000).to_a
leap_years = []
years.each do |year|
  leap_years << year if year % 4.zero?
end
