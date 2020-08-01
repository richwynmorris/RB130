# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.


require 'minitest/autorun'

class TestValue < Minitest::Test
    
  def setup
    @list = ['xyz']
  end

  def test_value
    assert_includes(@list, 'xyz')
  end
end

# Run options: --seed 10866

# # Running:

# .

# Finished in 0.000724s, 1381.1277 runs/s, 2762.2555 assertions/s.

# 1 runs, 2 assertions, 0 failures, 0 errors, 0 skips