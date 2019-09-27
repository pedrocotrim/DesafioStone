class EmailsController < ApplicationController
  before_action :authorize_call, except: :track

  def send_mail
    @email = Email.new(email_params)
    if @email.save
      params[:recipients].each do |x|
        SentMail.create(email: @email, recipient: x, opened: false)
      end
      render json: @email, status: :created, location: @email
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  def mail_stats
    @mail = Email.find_by(params[:id])
    opened_mail = SentMail.where(email: @mail, opened: true)
    stats = { 
      opened: "#{((opened_mail.length/@mail.sent_mails.length)*100).round(3)}\%",
      recipients: @mail.sent_mails
     }
    render json: stats
  end

  def track
    @email = SentMail.find_by(id: params[:id])
    if !@email&.opened
      @email&.opened = true
      @email&.save
    end
    send_file 'public/invis.png', type: 'image/png', disposition: 'inline'
  end

  def get_all_mails
    @emails = Email.all
    render json: @emails
  end

  private

  def email_params
    params.require(:email).permit(:sender, :sender_name, :body, :title, :priority)
  end
end
