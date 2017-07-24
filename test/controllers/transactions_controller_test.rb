require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @transaction = transactions(:one)
  end

  test "should get index" do
    get user_transactions_url(user_id: @user.id)
    assert_response :success
  end

  test "should get new" do
    get new_user_transaction_url(user_id: @user.id)
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post user_transactions_url(user_id: @user.id), params: { transaction: { amount: @transaction.amount, comment: @transaction.comment } }
    end

    assert_redirected_to user_transactions_url(user_id: @user.id)
  end
end
