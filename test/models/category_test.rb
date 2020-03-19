require 'test_helper'
class CategoryTest < ActiveSupport::TestCase
  test 'category has a valid category_name' do
    category=Category.new(category_name:'category_test');
    assert category.valid?
  end

  test 'category with empty category_name' do
    category=Category.new;
    assert_not category.valid?
  end
end