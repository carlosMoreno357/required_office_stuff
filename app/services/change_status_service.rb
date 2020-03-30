class ChangeStatusService
  def self.set(status_indicator, id, user)  
      item=Item.find(id)
      response = item.update(status: status_indicator)
      MailService.status_change_mail(user,item)
      response
  end
end