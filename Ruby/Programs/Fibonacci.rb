5.Program to find fibonacci series:
first = 0
second = 1
nextterm = 0

puts 'Enter the number of terms:-'
n = gets.chomp.to_i

puts "The first #{n} terms of Fibonacci series are:-"
c = 1
while c <= n + 1
  if c <= 1
    nextterm = c
  else
    puts nextterm
    nextterm = first + second
    first = second
    second = nextterm
  end
  c += 1
end

OUTPUT:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the number of terms:-
8
The first 8 terms of Fibonacci series are:-
1
1
2
3
5
8
13
21
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm and Ruby$ ruby Ruby.rb
Enter the number of terms:-
10
The first 10 terms of Fibonacci series are:-
1
1
2
3
5
8
13
21
34
55

