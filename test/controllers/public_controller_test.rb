require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post refill_url params: { uuid: @user.uuid, amount: 5 }
    end

    assert_response :success
  end

  test "incorrect amount" do
    post refill_url params: { uuid: @user.uuid, amount: -12 }
    assert_response :unprocessable_entity
  end

  test "no user" do
    post refill_url params: { uuid: "notexistedu", amount: 100 }
    assert_response :not_found
  end
end
