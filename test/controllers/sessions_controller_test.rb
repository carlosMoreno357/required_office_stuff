require 'test_helper'
class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get Login" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status
  end

  test "User logs in successfully and gets redirected to Items Index" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    get '/items/index'
    assert_response :success
  end

  test "User tries to access Items Index without been logged in" do
    get "/items/index"
    follow_redirect!
    assert_equal 302, status
  end
  
  test "Users logs out successfully" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    get "/logout"
    assert_equal 302, status
  end

end