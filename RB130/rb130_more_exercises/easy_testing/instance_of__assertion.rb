# Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.


require 'minitest/autorun'

class TestValue < Minitest::Test
    
  def setup
    @value = Numeric.new
  end

  def test_value
    assert_instance_of(Numeric, @value)
  end
end