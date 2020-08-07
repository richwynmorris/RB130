class DNA
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def hamming_distance(other)
    count = 0

    code.size <= other.size ? max_index = code.size : max_index = other.size

    code.chars.each_with_index do |char, index|
      next if index >= max_index
      count += 1 if char != other[index]
    end

    count
  end
end