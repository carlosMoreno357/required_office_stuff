class NewRequirementMailJob < ApplicationJob
  queue_as :default

  def perform(user,admin,new_item)
    StuffMailer.new_requirement_email(user,admin,new_item).deliver_later
  end
end
