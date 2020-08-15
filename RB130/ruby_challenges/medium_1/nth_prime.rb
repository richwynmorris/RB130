class Prime
  def self.nth(num)
    raise ArgumentError if num == 0
    position = num
    prime_numbers = []
    tracker = 2

    loop do
      break if prime_numbers.length == position
      prime_number = true
      prime_number = false if (2..Integer.sqrt(tracker)).to_a.any? {|num| tracker % num == 0 } 
      prime_numbers << tracker if prime_number == true
      tracker += 1
    end
    prime_numbers.pop 
  end
end