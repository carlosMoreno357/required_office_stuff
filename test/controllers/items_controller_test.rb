require 'test_helper'
class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    assert_equal 200, status
    assert_equal "/items/index", path
  end

  test "User tries to log in with invalid credentials" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: "1234"}
    follow_redirect!

    assert_equal 200, status
    assert_equal "/login", path
  end

  test "should get index as admin" do
    user = User.create(email: "test@testmail.com", password: "test_password", admin: true)
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    assert_equal 200, status
    assert_equal "/items/index", path
  end

  test "should get index with items filtered by open status" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    get '/items/index?filter=1'
    assert_response :success
  end

  test "should get index with items filtered by open status as admin" do
    user = User.create(email: "test@testmail.com", password: "test_password", admin: true)
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    get '/items/index?filter=1'
    assert_response :success
  end

  test "should get index with items filtered by fulfilled status" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    get '/items/index?filter=2'
    assert_response :success
  end


  test "should get index with items filtered by fulfilled status as admin" do
    user = User.create(email: "test@testmail.com", password: "test_password", admin:true)
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    get '/items/index?filter=2'
    assert_response :success
  end

  test "should get index with items filtered by dismissed status" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    get '/items/index?filter=3'
    assert_response :success
  end

  test "should get index with items filtered by dismissed status as admin" do
    user = User.create(email: "test@testmail.com", password: "test_password", admin: true)
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    get '/items/index?filter=3'
    assert_response :success
  end

  test "should get new view to create a new item" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email,
      password: user.password }
    follow_redirect!

    get '/items/new'
    assert_response :success
  end

  test "user creates new item" do
    user = User.create(email: "test@testmail.com", password: "test_password")
    get "/login"
    assert_equal 200, status

    post "/login", params: { email: user.email, password: user.password }
    follow_redirect!

    post "/items/create", params: { description: "test", category_id: 1, status: 1, user_id:user.id}
    follow_redirect!
    assert_equal 302, status
  end

  test "user changes item status to fulfilled" do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    user = User.create(email: "test@testmail.com", password: "test_password", admin:true)
    get "/login"
    assert_equal 200, status
    sleep 1.5
    post "/login", params: { email: user.email, password: user.password }
    follow_redirect!
    sleep 1.5
    item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: user.id )
    
    get "/items/fulfill?id=#{item.id}"
    assert_equal 302, status

  end

  test "user changes item status to dismissed" do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    user = User.create(email: "test@testmail.com", password: "test_password", admin:true)
    get "/login"
    assert_equal 200, status
    sleep 1.5
    post "/login", params: { email: user.email, password: user.password }
    follow_redirect!
    sleep 1.5
    item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: user.id )
    
    get "/items/dismiss?id=#{item.id}"
    assert_equal 302, status
  end

  test "user gets item details" do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    user = User.create(email: "test@testmail.com", password: "test_password", admin:true)
    get "/login"
    assert_equal 200, status
    sleep 1.5
    post "/login", params: { email: user.email, password: user.password }
    follow_redirect!
    sleep 1.5
    item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: user.id )
    
    get "/items/details?id=#{item.id}"
    assert_equal 200, status
  end

  test "user updates item details" do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    user = User.create(email: "test@testmail.com", password: "test_password", admin:true)
    get "/login"
    assert_equal 200, status
    sleep 1.5
    post "/login", params: { email: user.email, password: user.password }
    follow_redirect!
    sleep 1.5
    item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: user.id )
    
    post "/items/create_details", params: { id: item.id, details: "item details" }
    assert_equal 302, status
  end

end