class PhoneNumber
  NUMBERS = ['1','2','3','4','5','6','7','8','9','0']

  def initialize(num)
    @given_num = num
  end

  def number
    @total_digits = 0
    @extra_letters = 0

    @given_num.chars.each do |char|
      @total_digits += 1 if NUMBERS.include?(char)
      @extra_letters += 1 if char.match?(/[A-Za-z]/)
    end

    if @total_digits == 10 && @extra_letters == 0
      @given_num.gsub!(/[^0-9]/, '')
    elsif @total_digits == 11 && @given_num[0] == '1'
      @given_num.delete_prefix!('1')
    else
      return '0000000000'
    end
    @given_num
  end

  def area_code
    @given_num.slice(0..2)
  end

  def to_s
    number = self.number
    "(#{number.slice!(0..2)}) #{number.slice!(0..2)}-#{number.slice!(0..3)}" 
  end
end