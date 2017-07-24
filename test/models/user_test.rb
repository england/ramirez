require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "default values" do
    user = User.create(name: "test_ut1", email: "test_ut1@test.test", phone: "93843647326")
    assert_equal 0, user.balance
    assert_instance_of String, user.uuid
  end
end
