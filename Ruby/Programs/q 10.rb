# 10 Given a string s and an array of strings words, determine whether s is a prefix string of words. 
def is_prefix_string(s, words)
  joined = ''
  index = 0
  while index < words.size
    joined << words[index]
      if s == joined
        return true
      end
    index += 1
  end
  false
end


