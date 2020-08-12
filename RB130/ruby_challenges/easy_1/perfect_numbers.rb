class PerfectNumber
  def self.classify(num)
    factors = (1..num - 1).to_a.select! { |int| num % int  == 0 } 
    if factors.sum == num
      return 'perfect'
    elsif factors.sum > num
      return 'abundant'
    else
      return 'deficient'
    end
  end
end