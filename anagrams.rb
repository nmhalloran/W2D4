def first_anagram(string, anagram)

  string_array = string.chars
  permutations = string_array.permutation.to_a
  test_word = anagram.chars
  permutations.include?(test_word)

end

def second_anagram(string, anagram)
  anagram_hash = Hash.new(0)
  string_hash = Hash.new(0)

  string.chars.each do |char|
    string_hash[char] ? string_hash[char] += 1 : string_hash[char] = 1
  end

  anagram.chars.each do |char|
    anagram_hash[char] ? anagram_hash[char] += 1 : anagram_hash[char] = 1
  end

  string_hash.all? do |k,v|
    string_hash[k] == anagram_hash[k]
  end

end

str1 = (1..100000).to_a.join
str2 = (2..100000).to_a.join
start_time = Time.now
p second_anagram(str1, str2)
end_time = Time.now

p "solution: #{end_time - start_time}"
