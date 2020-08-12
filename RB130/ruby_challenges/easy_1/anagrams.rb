# Anagrams
# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.
# Rules
# - we are matching the word to all other words in arr
# - there is a match method that will check /#{word.chars.sort.join}/ =~ eachword.chars.sort.join
# - case sensitive
# - 
# =end

class Anagram
  attr_reader :word
  def initialize(word)
    @word = word
  end
  
  def match(arr)
    arr.each_with_object([]) do |val, obj|
      obj << val if val.downcase.chars.sort == word.downcase.chars.sort &&
      val.downcase != word.downcase
    end
  end
  
end

