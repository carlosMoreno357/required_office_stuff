require 'test_helper'
class ItemTest < ActiveSupport::TestCase
  test 'item has a valid description, category and status' do
    item=Item.new(description: 'valid_description', category_id: 1, status: 1 )
    assert item.valid?
  end

  test 'item without description' do
    item=Item.new
    assert_not item.valid?
  end

  test 'item updated with a valid comment' do
    item=Item.new(description: 'valid_description', category_id: 1, status: 1 )
    item.update(comment:'test comment')
    assert item.valid?
  end
end