require 'test_helper'
class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "User creates a comment" do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status
    sleep 1.5
    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!
    sleep 1.5
    item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: user.id )
    
    post "/comments/create_comment", params: { item_id: item.id,
      description: "description" }
    follow_redirect!

    assert_equal 302, status
    assert_equal "/", path
  end
end