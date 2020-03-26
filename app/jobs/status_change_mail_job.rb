class StatusChangeMailJob < ApplicationJob
  queue_as :default

  def perform(user,item)
    StuffMailer.status_change_email(user,item).deliver_later
  end
end
