require 'test_helper'
class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index after creating a new item" do
    post '/items/create',
     params: { description: 'valid_description', category: '1'},
     headers: { 'content-type': 'multipart/form-data' }
     assert_equal 302, status
  end

  test "should get index after updated the requirement details" do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    user = User.create(email: "test@testmail.com", password: "test_password")
    sleep 1.5
    get "/login"
    assert_equal 200, status
    sleep 1.5
    post "/login", params: { email: user.email, password: user.password }
    follow_redirect!
    sleep 1.5
    item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: user.id )
    sleep 1.5
    post '/items/create_details',
     params: { id: item.id, details: "test_details"},
     headers: { 'content-type': 'multipart/form-data' }
     follow_redirect!
     assert_equal 302, status
  end
end