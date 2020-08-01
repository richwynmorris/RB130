# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).


require 'minitest/autorun'

class TestValue < Minitest::Test
    
  def setup
    @value = 1
  end

  def test_value
    assert_kind_of(Numeric, @value)
  end
end

