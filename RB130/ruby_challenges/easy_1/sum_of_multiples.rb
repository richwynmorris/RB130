class SumOfMultiples

  def initialize(*num)
    @inst_num = num
  end

  def self.to(num)
    self.new(3,5).to(num)
  end

  def to(num)
    result = 0
    0.upto(num - 1) do |num|
      result += num if @inst_num.any? {|divis| num % divis == 0 }
    end
    result
  end
end 