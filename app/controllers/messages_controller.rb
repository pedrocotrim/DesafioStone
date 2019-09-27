class MessagesController < ApplicationController
  before_action :authorize_call
require 'rest-client'
  def send_message
    @message = Message.new(body: params[:body])
    if @message.save
      request = { sendSmsMultiRequest: {
          aggregateId: @message.id,
          sendSmSRequestList: []
        } 
      }
      time = (DateTime.now + 60.second).strftime('%Y-%m-%dT%H:%M:%S')
      params[:recipients].each do |x|
        request[:sendSmSRequestList].push { 
          from: "Stone",
          to: x,
          schedule: time,
          msg: @message.body,
          callbackOption: "NONE",
          flashSms: false }
      end
      RestClient.post("https://private-anon-7a4c405f25-zenviasms.apiary-mock.com/services/send-sms-multiple", request.to_json, {content_type: :json, Authorization: "Basic YWRtaW46YWRtaW4=", accept: :json})
      render json: { tracking_id: @message.id }, status: :created
    end
  end
end
