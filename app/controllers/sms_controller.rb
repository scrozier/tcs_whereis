class SmsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def incoming
    render text: "TCS Responder, at your service!"
  end

  def respond
    twilio_number = '4694164526'
    client = Twilio::REST::Client.new 'AC9a67eb2214115a6e1a500dd7aa63ecb5', '2367cdf7e0f18548db85e76c580d5052'
    response = "Here's lookin' at you, kid."
    message = client.account.messages.create(
      from: twilio_number,
      to: '+12147043209',
      body: response
      )
  end    

end
