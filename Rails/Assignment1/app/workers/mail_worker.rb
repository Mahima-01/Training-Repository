class MailWorker
  include Sidekiq::Worker
  
  def perform(email, first_name)
    @email = email
    @first_name= first_name
    CrudNotificationMailer.create_notification.deliver_later
  end
end