# Write a test that will fail if list and the return value of list.process are different objects.


require 'minitest/autorun'

class List
  def process
    self
  end
end

class TestValue < Minitest::Test
    
  def setup
    @list = List.new
  end

  def test_value
    assert_same(@list, @list.process)
  end
end