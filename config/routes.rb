Rails.application.routes.draw do
  root 'welcome#index'
  post 'incoming_sms' => 'sms#incoming'
end
