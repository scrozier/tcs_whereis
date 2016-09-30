class MainController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :incoming

  def index
    if params[:query]
      @response = [params[:query], ConferenceRoom.replies_for(params[:query])]
    end
  end

  def incoming
    body = params["Body"]
    response = ConferenceRoom.replies_for body
    twilio_number = '4694164526'
    client = Twilio::REST::Client.new 'AC9a67eb2214115a6e1a500dd7aa63ecb5', '2367cdf7e0f18548db85e76c580d5052'
    message = client.account.messages.create(
      from: twilio_number,
      to: params["From"],
      body: response
      )
    render nothing: true
  end
end
