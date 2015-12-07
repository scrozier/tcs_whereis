Rails.application.routes.draw do
  root 'main#index'
  post 'sms_incoming' => 'sms#incoming'
end
