class WordProblem
  CALCULATIONS = {'plus' => '+', 'minus' => '-', 'multiplied' => '*', 'divided' => '/'}

  def initialize(phrase)
    @phrase = phrase
  end

  def answer
    @phrase.gsub!('?', '')

    elements = @phrase.split.map! do |word|
        if word == word.to_i.to_s
          word.to_i
        elsif CALCULATIONS.include?(word)
          word
        else
          next
        end
      end.delete_if{|el| el == nil }

    raise ArgumentError if elements.empty? || !elements.any? { |word| CALCULATIONS.keys.include?(word) }
    
    if elements.slice(0..3) == elements 
      elements[0].send CALCULATIONS[elements[1]], elements[2]
    else
      sum = elements[0].send CALCULATIONS[elements[1]], elements[2]
      sum.send CALCULATIONS[elements[3]], elements[4]
    end
  end
end


