require 'test_helper'
class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test "application gets true when a user is logged in" do
    assert :logged_in?
  end

  test "user visits unauthorized url" do
    get "/items/index"
    follow_redirect!
    assert_equal 200, status
    assert :authorized
  end

  test "application gets current user" do
     user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    :current_user
    assert :current_user
  end

end