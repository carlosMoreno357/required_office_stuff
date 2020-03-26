class CommentMailJob < ApplicationJob
  queue_as :default

  def perform(user,item)
    StuffMailer.comment_email(user,item).deliver_later
  end
end
