require 'minitest/autorun'

class EqualityTest < MiniTest::Test
  def test_value_equality
    str1 = "Hello there"
    str2 = "Hello there"

    assert_equal(str1, str2)
    assert_same(str1, str2)
  end
end

