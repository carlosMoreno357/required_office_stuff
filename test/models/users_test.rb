require 'test_helper'
class UserTest < ActiveSupport::TestCase
  test 'user gets registered successfully' do
    user = User.create(email: "test@testmail.com", password: "test_password")
    assert user.valid?
  end

  test 'user gets updated to admin successfully' do
    user = User.create(email: "test@testmail.com", password: "test_password")
    updated=user.update(admin: true)
    assert_equal updated, true
  end
end