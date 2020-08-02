require 'minitest/autorun'

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class TestTransaction < Minitest::Test
  def test_prompt_payment
    @transaction = Transaction.new(10)
    @transaction.amount_paid = 10

    input = StringIO.new("10\n")
    output = StringIO.new(" ")
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(10, @transaction.amount_paid)      
  end
end