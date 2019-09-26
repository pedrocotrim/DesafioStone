class EmailsController < ApplicationController
  #before_action :authorize_call

  def send_mail
    @email = Email.new(email_params)
    if @email.save
      params[:recipients].each do |x|
        SentMail.create(email: @email, recipient: x, opened: false)
      end
    end
  end

  def track
    @email = SentMail.find_by(id: params[:id])
    if !@email&.opened
      @email&.opened = true
      @email&.save
    end
    send_file 'public/invis.png', type: 'image/png', disposition: 'inline'
  end

  private

  def email_params
    params.require(:email).permit(:sender, :sender_name, :body, :title, :priority)
  end
end
