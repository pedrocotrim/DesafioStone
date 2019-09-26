class SendMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_mailer.email.subject
  #
  def email
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def send_mail
    @body = params[:email].body
    @email = params[:email]
    mail from: "#{@email.sender_name} <#{@email.sender}>", to: params[:recipient], subject: @email.title
  end

end
