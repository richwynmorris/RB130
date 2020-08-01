require 'minitest/autorun'

class TestValue < Minitest::Test
    
  def setup
    @value = 6
  end

  def test_value
    assert_equal(false, @value.odd?)
  end
end

# Run options: --seed 36907

# # Running:

# .

# Finished in 0.000793s, 1260.4269 runs/s, 1260.4269 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips