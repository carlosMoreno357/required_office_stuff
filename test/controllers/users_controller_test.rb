require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest
  test "Should get form to fill new user data" do
    get "/signup"
    assert_equal 200, status
  end

  test "User gets created successfully" do
    get "/signup"
    assert_equal 200, status

    post "/users", params: { user: {email: "test_user",
      password: "test_password" }}
    follow_redirect!
    assert_equal 302, status
  end

end