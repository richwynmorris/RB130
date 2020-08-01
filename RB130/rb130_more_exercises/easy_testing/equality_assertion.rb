# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.


require 'minitest/autorun'

class TestValue < Minitest::Test
    
  def setup
    @value = 'XYZ'
  end

  def test_value
    assert_equal('xyz', @value.downcase)
  end
end

# Run options: --seed 51006

# # Running:

# .

# Finished in 0.000765s, 1308.0308 runs/s, 1308.0308 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips