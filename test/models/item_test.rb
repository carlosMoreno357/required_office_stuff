require 'test_helper'
class ItemTest < ActiveSupport::TestCase
  test 'item has a valid description, category, status and belongs to a user' do
    user = User.create(email: "test@testmail.com", password: "test_password")
    category = Category.create(category_name: "TEST CATEGORY", colour: "#498467")
    item=Item.create(description: 'valid_description', category_id: category.id, status: 1, user_id: user.id )
    assert item.valid?
  end

  test 'item without description' do
    item=Item.new
    assert_not item.valid?
  end

  test 'item updated with a valid comment' do
    item=Item.create(description: 'valid_description', category_id: 1, status: 1, user_id: 1)
    update = Item.last.update(details:'test comment')
    assert update
  end
end