# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.


require 'minitest/autorun'

class TestValue < Minitest::Test

  def test_value
    assert_raises(NoWorkExperience) { employee.hire }
  end
end