=begin
puts "Hello,started learning Ruby";
puts "This is main Ruby Program"
BEGIN {
   puts "Initializing first Ruby Program"
}

END {
   puts "Terminating Ruby Program"
}
BEGIN {
   puts "Initializing second Ruby Program"
}
=end

=begin
# EXAMPLE OF CONSTANT VARIABLE:
class Example
 VAR1 = 100
 VAR2 = 200
 def show
 puts "Value of first constant is #{VAR1}"
 puts "Value of second constant is #{VAR2}"
 end
end
object = Example.new()
object.show
=end

=begin
# Instance Variable example:
class Customer
 def initialize(id, name, addr)      
# Instance Variables     
 @cust_id = id
 @cust_name = name
 @cust_addr = addr
 end
 # displaying result
 def display_details()
 puts "Customer id #@cust_id"
 puts "Customer name #@cust_name"
 puts "Customer address #@cust_addr"
 end
end
# Create Objects
cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2 = Customer.new("2", "Poul", "New Empire road, Khandala")  
# Call Methods
cust1.display_details()
cust2.display_details()
=end

=begin
# EXAMPLE OF CLASS VARIABLE:
class Customer
# class variable
 @@no_of_customers = 0
 def initialize(id, name, addr)   
# An instance Variable
 @cust_id = id
 @cust_name = name
 @cust_addr = addr
 end
# displaying result 
 def display_details()
 puts "Customer id #@cust_id"
 puts "Customer name #@cust_name"
 puts "Customer address #@cust_addr"
 end 
 def total_no_of_customers()   
# class variable
 @@no_of_customers += 1
 puts "Total number of customers: #@@no_of_customers"
    end
end
# Create Objects
cust1 = Customer.new("1", "Ram", "BPTP, Faridabad")
cust2 = Customer.new("2", "Ruchi", "Gol Chakkar road,Kalkaji")
# Call Methods
cust1.display_details()
cust1.total_no_of_customers()
cust2.display_details()
cust2.total_no_of_customers()
=end

=begin
# global variable
$global_variable = 10
class Class1
 def print_global
 puts "Global variable in Class1 is #$global_variable"
 end
end
class Class2
 def print_global
 puts "Global variable in Class2 is #$global_variable"
 end
end
class1obj = Class1.new
class1obj.print_global
class2obj = Class2.new
class2obj.print_global
=end

=begin
# EXAMPLE OF LOCAL VARIABLE:
color = "Red"
def method1 
color = 192
puts("Color Value in method1 : ",color)
end 

def method2
color = 255
puts("Color Value method2: ",color)
end

method1 
method2  
method1
puts("Color Value outside methods : "+color)
=end

=begin
# Another example of Instance Variable:
class Student
  def initialize(student_id, student_name)
    @student_id = student_id
    @student_name = student_name
  end
  
  def show
    puts "Student Name and ID : "
    puts(@student_id, @student_name)
  end
end
Student.new(1, "Sara").show
Student.new(2, "Raju").show
=end

=begin
BEGIN { 
   # BEGIN block code 
   puts "BEGIN code block"
} 

END { 
   # END block code 
   puts "END code block"
}
   # MAIN block code 
puts "MAIN code block"
=end

module Week
   FIRST_DAY = "Sunday"
   def Week.weeks_in_month
      puts "You have four weeks in a month"
   end
   def Week.weeks_in_year
      puts "You have 52 weeks in a year"
   end
end

