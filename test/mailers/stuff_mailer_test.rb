require 'test_helper'

class StuffMailerTest < ActionMailer::TestCase

  test "email has been sent to administrators when a new item is requested" do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    @admin = User.create(email: 'carlos.moreno.salazar@gmail.com', password: '1234', admin:true)
    sleep 1.5
    @user = User.create(email: 'carlos.moreno@tangosource.com', password: '1234')
    sleep 1.5
    @item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: @user.id)
    sleep 1.5
    email = StuffMailer.new_requirement_email(@user,@admin.email,@item).deliver_now
    assert_emails 1

  end

  test "email has been sent to user when an item's status changes" do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    @user = User.create(email: 'carlos.moreno@tangosource.com', password: '1234')
    sleep 1.5
    @item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: @user.id)
    sleep 1.5
    email = StuffMailer.status_change_email(@user,@item).deliver_now
    assert_emails 1

  end

  test "email has been sent to user when an item gets commented" do
    @category = Category.create(category_name:'test category', colour: "#F02D3A")
    sleep 1.5
    @user = User.create(email: 'carlos.moreno@tangosource.com', password: '1234')
    sleep 1.5
    @item=Item.create(description: 'valid_description', category_id: @category.id, status: 1, user_id: @user.id)
    sleep 1.5
    @comment = Comment.create(description: "desc", item_id: @item.id, user_id: @user.id)

    email = StuffMailer.comment_email(@user,@item).deliver_now
    assert_emails 1
  end
end
