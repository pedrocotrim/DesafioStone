class SentMail < ApplicationRecord
  belongs_to :email
  
  after_create :send_mail

  private

  def send_mail
    SendMailer.with(email: self.email, recipient: self.recipient).send_mail.deliver_later
  end

end
