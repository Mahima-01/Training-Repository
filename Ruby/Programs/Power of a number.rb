# Ruby code to calculate power of a number:
def pow(a, b)
  power = 1
  for i in 1..b
    power *= a
  end
    return power
end

puts 'Enter Base:-'
base = gets.chomp.to_i

puts 'Enter exponent:-'
expo = gets.chomp.to_i

puts "The power is #{ pow(base, expo)}"

OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter Base:-
7
Enter exponent:-
3
The power is 343
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter Base:-
12
Enter exponent:-
3
The power is 1728
