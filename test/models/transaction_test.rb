require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "negative balance validation" do
    user = users(:user_with_zero_balance)
    transaction = user.transactions.new(amount: -5)
    assert !transaction.save, "dont save"
    assert transaction.new_record?, "not new"
    assert transaction.errors.any?, "no errors"
    assert_equal 0, user.reload.balance
  end

  test "update user balance" do
    user = users(:user_with_zero_balance)
    transaction = user.transactions.new(amount: 3)
    assert transaction.save
    assert_equal 3, user.balance
    assert_equal 3, user.reload.balance
  end
end
