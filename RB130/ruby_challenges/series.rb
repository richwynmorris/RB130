class Series
  def initialize(numbers_str)
    @numbers = numbers_str
  end

  def slices(slice)
    results = []
    num = slice

    @numbers.chars.each_with_index do |char, index|
      container = []
      next_index = index
      loop do
        break if container.length == num || next_index == @numbers.length
        container << @numbers[next_index].to_i
        next_index += 1
      end
      results << container
    end

    results.delete_if {|arr| arr.length < num}
    raise ArgumentError if results == []
    results
  end
end