
def anagram(str1, str2)
  str1 = sanitize(str1)
  str2 = sanitize(str2)

  return false if str1 == '' || str2 == ''
  return false if str1.length != str2.length

  hash1 = char_count(str1)
  hash2 = char_count(str2)
  (hash1 == hash2).to_s
end

def sanitize(str)
  str.gsub(/[^0-9A-Za-z]/, '')
end

def char_count(str)
  str.downcase.each_char.with_object(Hash.new(0)) {|char, hash| hash[char] += 1}
end


# requirements/tests
puts '==== > Positive'
puts anagram('ab', 'ba') # => true
puts anagram('ab', 'AB') # => true
puts anagram('ab', 'b a') # => true
puts anagram('ab', 'a b') # => true
puts anagram('ab', 'a-b') # => true
puts anagram('ab', 'A_B') # => true

puts '==== > Negative'
puts anagram('ab', 'bb') # => false
puts anagram('aab', 'ab') # => false
puts anagram('ab', '') # => false
puts anagram('', '') # => false
puts anagram('ab', 'a a') # => false
puts anagram('ab', 'a A') # => false
puts anagram('ab', 'b B') # => false
puts anagram('__', '&^!&!') # => false
puts anagram('__', '__') # => false