Rails.application.routes.draw do
  root 'home#index'
  get '/api' => 'home#api'
  post 'download_today_calls', to: 'home#download_today_calls', as: :download_today_calls
end
