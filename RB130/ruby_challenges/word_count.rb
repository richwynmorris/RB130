=begin
Write a program that given a phrase can count the occurrences of each word in that phrase.

For example, if we count the words for the input "olly olly in come free", we should get:

olly: 2
in: 1
come: 1
free: 1
Test suite:
=end


# Test data version:
class Phrase
  attr_reader :name
  def initialize(name)
    @name = name
  end
  
  def word_count
    name.gsub(/[^\w|(?=')]/, ' ').split(' ').each_with_object(Hash.new(0)) do |word, hsh|
      word.delete!("'") if word.count("'") == 2 
      hsh[word.downcase] += 1
    end
  end
end
  
