# Write a minitest assertion that will fail if the Array list is not empty.


require 'minitest/autorun'

class TestValue < Minitest::Test
    
  def setup
    @value = []
  end

  def test_value
    assert_empty(@value)
  end
end

# Run options: --seed 6334

# # Running:

# .

# Finished in 0.000769s, 1300.6743 runs/s, 1300.6743 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips