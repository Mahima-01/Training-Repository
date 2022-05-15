# 7.Given two strings s and t, return true if t is an anagram of s, and false otherwise.
module Anagram
  def Anagram.anagram?(s,t)
    hash_s = Hash.new
    hash_t = Hash.new
    (s.chars.uniq.sort).each { |char| hash_s[char] =   s.count(char) }
    (t.chars.uniq.sort).each { |char| hash_t[char] =   t.count(char) }
    print hash_s, hash_t, "\n"
    if hash_s == hash_t
      print "it is anagram", "\n"
    end
  end
end
#s = 'bored'
#t = 'robed'
#print Anagram.anagram?(s,t)

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb 115
{"b"=>1, "d"=>1, "e"=>1, "o"=>1, "r"=>1}{"b"=>1, "d"=>1, "e"=>1, "o"=>1, "r"=>1}
it is anagram
