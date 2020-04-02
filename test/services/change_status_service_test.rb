require 'test_helper'
class ChangeStatusServiceTest < ActiveSupport::TestCase
  test 'Item status can be changed to fulfill by the service' do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    user = User.create(email: "test@testmail.com", password: "test_password", admin: true)
    sleep 1.5
    item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: user.id )
    sleep 1.5
    response = ChangeStatusService.set(0,item.id,user)
    assert response
  end

  test 'Item status can be changed to dismissed by the service' do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    user = User.create(email: "test@testmail.com", password: "test_password", admin: true)
    sleep 1.5
    item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: user.id )
    sleep 1.5
    response = ChangeStatusService.set(2,item.id,user)
    assert response
  end
end