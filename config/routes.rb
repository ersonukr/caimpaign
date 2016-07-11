Rails.application.routes.draw do
  root 'home#index'
  get '/api' => 'home#api'
end
