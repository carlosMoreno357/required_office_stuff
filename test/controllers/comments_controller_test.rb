require 'test_helper'
class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "User creates a comment" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    item=Item.create(description: 'valid_description', category_id: 1, status: 1, user_id: user.id )
    
    post "/comments/create_comment", params: { item_id: item.id,
      description: "description" }
    follow_redirect!

    assert_equal 302, status
    assert_equal "/", path
  end
end