require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  attr_reader :car

  def setup
    @car = Car.new
  end

  def test_wheels
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip('Example of skipped test!')
    assert_equal(3, car.wheels)
  end

  def test_car_exists
    assert(car)
  end

  def test_car_name
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
       Car.new(name: 'Joey')
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end

  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)          # this will pass
  end
end