# Preview all emails at http://localhost:3000/rails/mailers/crud_notfication
class CrudNotficationPreview < ActionMailer::Preview
    # Preview this email at http://localhost:3000/rails/mailers/crud_notfication/new
    def create_notification
      student = FactoryBot.create(:student)
      CrudNotificationMailer.create_notification(student)
    end
  end