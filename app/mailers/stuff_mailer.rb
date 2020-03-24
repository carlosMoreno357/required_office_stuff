class StuffMailer < ApplicationMailer
    def new_requirement_email(user,admin,new_item)
      @user = user
      @new_item = new_item
      mail(to: admin, subject: 'New stuff requirement')
    end

    def status_change_email(user,item)
      @user = user
      @item = item
      mail(to: @user.email, subject: 'New stuff requirement')
    end

    def comment_email(user,item)
      @user = user
      @item = item
      mail(to: @item.user.email, subject: 'Stuff requirement - New comment')
    end
end
