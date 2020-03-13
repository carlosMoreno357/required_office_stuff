class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/items/index'
    assert_response :success
  end

  test "should get index with items filtered by open status" do
    get '/items/index?filter=1'
    assert_response :success
  end

  test "should get index with items filtered by fulfilled status" do
    get '/items/index?filter=2'
    assert_response :success
  end

  test "should get index with items filtered by dismissed status" do
    get '/items/index?filter=3'
    assert_response :success
  end

  test "should get new view to create a new item" do
    get '/items/new'
    assert_response :success
  end

end