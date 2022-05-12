# Give a string S, print all permuatation of a given string.
p "abc".chars.permutation.map{ |i| i.join }

# chars separates the string into an array of single characters.
# Use map to transform each element in the data, then use join to transform the whole thing into a string you can print out.

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
["abc", "acb", "bac", "bca", "cab", "cba"]
