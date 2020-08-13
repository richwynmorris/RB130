class Luhn
  attr_reader :luhn_num

  def initialize(num)
    @luhn_num = make_luhn(num)
  end

  def make_luhn(num)
    num.digits.map.with_index do |num, index|
      if index.odd?
        if num * 2 > 10
          (num * 2) - 9
        else
          num * 2
        end
      else
        num
      end
    end.reverse
  end

  def addends
    @luhn_num
  end

  def checksum
    @luhn_num.sum 
  end

  def valid?
    @luhn_num.sum % 10 == 0
  end

  def self.create(num)
    original_number_in_digits = num.digits.reverse << 0
    loop do
      new_luhn = self.new(original_number_in_digits.join.to_i)
      break if new_luhn.valid?
      original_number_in_digits[-1] += 1
    end
    original_number_in_digits.join.to_i
  end
end