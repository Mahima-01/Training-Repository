# 49. Palindromic date program:
require 'date'

def is_palindrome(date)
  if date == date.reverse
    return true
  else
    return false
  end
end

def is_date_palindrome(date)
  date = Date.strptime(date, '%d/%m/%Y')
  counter = 0
  date_string = date.strftime("%d%m%Y")
  if !is_palindrome(date_string)
    counter += 1
  end
  date_string = date.strftime("%m%d%Y")

  if !is_palindrome(date_string)
    counter += 1
  end

  if counter >0 
    print "Not a palindrome \n"
  else
    print "It is a palindrome \n"
  end
end


print 'Enter the date to find if it is palindrome : '
date = gets
is_date_palindrome(date)


Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
Enter the date to find if it is palindrome : 11/12/2022                  
Not a palindrome 

itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
Enter the date to find if it is palindrome : 02/02/2020
It is a palindrome 
