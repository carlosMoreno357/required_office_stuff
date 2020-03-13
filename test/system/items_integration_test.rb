require 'test_helper'
class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index after creating a new item" do
    post '/items/create',
     params: { description: 'valid_description', category: '1'},
     headers: { 'content-type': 'multipart/form-data' }
    assert_response :created
  end

  test "should get index after updated the requirement comment" do
    post '/items/create_comment',
     params: { id: 1, comment: "test_comment"},
     headers: { 'content-type': 'multipart/form-data' }
    assert_response :success
  end
end