class Sieve

  def initialize(num)
    @number = num
  end

  def primes
    prime_numbers = []
    array = (2..@number).to_a.reverse

    array.each do |each_num|
      2.upto(@number) do |num|
        if each_num % num == 0
          prime_numbers << num
          break
        end
      end
    end
    prime_numbers.uniq.sort!
  end
end

