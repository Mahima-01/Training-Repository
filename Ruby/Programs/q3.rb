# 3.Given a string s, reverse only all the vowels in the string and return it.
def reverse_vowels(s)
  hash = {}
  s_copy = s
  s.chars.each_with_index do |chr, index|
    if 'aeiouAEIOU'.include? chr
      hash[index] = chr
    end
  end
  vals = hash.values.reverse
  keys = hash.keys
  new_hash = keys.zip(vals).to_h
  keys.each do |key|
    s_copy[key] = new_hash[key] 
  end
  s_copy
end
print reverse_vowels('I am learning programming language')

itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb
e am luarning pragromming langeagI
