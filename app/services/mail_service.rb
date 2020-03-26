class MailService
  def self.new_requirement_mail(user,admin,new_item)
    NewRequirementMailJob.perform_later(user,admin,new_item)
  end

  def self.status_change_mail(user,item)
    StatusChangeMailJob.perform_later(user,item)
  end

  def self.comment_mail(user,item)
    CommentMailJob.perform_later(user,item)
  end
  
end