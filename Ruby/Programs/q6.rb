# 6. Given a String S, reverse the string without reversing its individual words. Words are separated by dots. 
def reverse_words(string)
  return string.split(" ").reverse.join(" ")
end

print reverse_words('Hello World')

itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
World Hello
