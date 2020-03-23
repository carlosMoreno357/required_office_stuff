class StuffMailer < ApplicationMailer
    def new_requirement_email(user,admin,new_item)
        @user = user
        @new_item = new_item
        mail(to: admin, subject: 'New stuff requirement')
      end
end
