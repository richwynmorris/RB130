class Trinary
  def initialize(num)
    @number = num
  end

  def to_decimal
    return 1 if @number.eql?('1')
    return 0 if @number.chars.any? {|char| char.match(/[a-zA-z|[3-9]]/)}


    result = 0

    @number.chars.reverse.each_with_index do |char, index|
      result += char.to_i * 3 ** index
    end

    result
  end
end