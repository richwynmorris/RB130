# Write a test that will fail if 'xyz' is one of the elements in the Array list:


require 'minitest/autorun'

class TestValue < Minitest::Test
    
  def setup
    @value = ['xyz']
  end

  def test_value
    refute_includes(@value, 'xyz')
  end
end