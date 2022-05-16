# 35 You are given two strings of the same length s and t. In one step you can choose any character of t and replace it with another character. Return the minimum number of steps to make t an anagram of s. An Anagram of a string is a string that contains the same characters with a different (or the same) ordering. 
def min_steps(s, t)
  s = s.chars.tally
  t = t.chars.tally
  (s.keys | t.keys).sum do |c|
    (s.fetch(c, 0) - t.fetch(c, 0)).abs
  end / 2
end
s = 'leetcode'
t = 'practise'
print (min_steps(s, t))

