require "rails_helper"
RSpec.describe CrudNotificationMailer, type: :mailer do
  describe "mail sent" do
    let(:student){FactoryBot.create(:student)}
    let(:mail) { CrudNotificationMailer.create_notification(student) }
    it "renders the headers" do
      expect(mail.subject).to eq("A new entry for Student has been created")
      expect(mail.to).to eq(["mahima@gamil.com"])
      expect(mail.from).to eq(["from@example.com"])
    end
    it "renders the body" do
      expect(mail.body.encoded).to match("Student")
    end
  end
end