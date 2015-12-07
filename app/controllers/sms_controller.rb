class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def incoming
    body = params["Body"]
    response = reply_for body
    twilio_number = '4694164526'
    client = Twilio::REST::Client.new 'AC9a67eb2214115a6e1a500dd7aa63ecb5', '2367cdf7e0f18548db85e76c580d5052'
    message = client.account.messages.create(
      from: twilio_number,
      to: params["From"],
      body: response
      )
    render nothing: true
  end

  def reply_for(query)
    query + ' is located ' + case query.downcase
    when 'fill their baskets', 'service selection price', 'man in the desert', 'air of excitement'
      'in the vendor conference area (off of reception)'
    when 'data central'
      'in the Information Systems area'
    when 'perfect product presentation', 'main and main'
      'at the north end of the Information Systems area'
    when '1 great = 3 good', 'intuition does not come to an unprepared mind'
      'off the atrium, behind reception'
    when 'gumby'
      "where gumby has always been located...c'mon!"
    when 'contain yourself'
      'upstairs, south end, adjacent to CSD'
    when 'we love our employees'
      'upstairs, south end, adjacent to CSD (seating area in front of Contain Yourself)'
    when 'all eyes on elfa'
      'upstairs, southwest corner'
    when 'service = selling', 'fun and functional'
      'upstairs, southwest corner, adjacent to loss prevention'
    when 'communication is leadership'
      'upstairs, northwest corner, adjacent to the executive suite'
    when 'we sell the hard stuff', 'blue sky'
      'up the stairs, turn right (adjacent to merchandising)'
    else
      "somewhere, but I don't know where"
    end
  end
end
