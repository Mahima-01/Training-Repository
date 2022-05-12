2. Write a function to return reverse of a string using recursion.
def reverse(string)
  reversed_str = ""
  i = 0
    while i < string.length
      reversed_str = string[i] + reversed_str
      i += 1
  end
  reversed_str
end

print reverse('Mahima')

Output:
3.0.0 :273 > def reverse(string)
3.0.0 :274 >   reversed_str = ""
3.0.0 :275 >   i = 0
3.0.0 :276 >     while i < string.length
3.0.0 :277 >       reversed_str = string[i] + reversed_str
3.0.0 :278 >       i += 1
3.0.0 :279 >   end
3.0.0 :280 >   reversed_str
3.0.0 :281 > end
 => :reverse 
3.0.0 :282 > print reverse('Mahima')
amihaM => nil 
3.0.0 :283 > print reverse('I am learning ruby')
ybur gninrael ma I => nil 
