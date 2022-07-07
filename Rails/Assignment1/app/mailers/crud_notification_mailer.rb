class CrudNotificationMailer < ApplicationMailer
  def create_notification
    mail to: 'mahima@gmail.com', subject: "A new entry has been created."
  end
    
      
  def update_notification
    mail to: 'mahima@gmail.com', subject: "A new entry has been updated."
  end
    
    
  def delete_notification
    mail to: 'mahima@gmail.com', subject: "A new entry has been deleted." 
  end
end
