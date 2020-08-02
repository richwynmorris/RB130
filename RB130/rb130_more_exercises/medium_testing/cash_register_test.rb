require 'minitest/autorun'

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class TestCashRegister < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def test_accept_money
    @transaction.amount_paid = 10
    @cash_register.accept_money(@transaction)
    result =  @cash_register.total_money
    assert_equal(110, result)
  end

  def test_change
    @transaction.amount_paid = 20
    result = @cash_register.change(@transaction)
    assert_equal(10, result)
  end

  def test_give_receipt
        assert_output("You've paid $#{item_cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end
end