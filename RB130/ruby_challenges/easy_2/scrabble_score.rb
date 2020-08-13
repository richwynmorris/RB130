class Scrabble
  SCRABBLE_POINTS = {
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K'],
    8 => ['J', 'X'],
    10 => ['Q', 'Z']
  }

  def initialize(word)
    @word = word
  end

  def score(word=@word)
    return 0 if @word == nil 
    score = 0

    @word.chars.each do |char|
      SCRABBLE_POINTS.each do |key, value|
        score += key if value.include?(char.upcase)
      end
    end

    score
  end

  def self.score(word)
    self.new(word).score(word)
  end
end