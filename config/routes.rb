Rails.application.routes.draw do
  post 'incoming_sms' => 'sms#incoming'
end
