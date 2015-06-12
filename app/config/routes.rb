Rails.application.routes.draw do
  root to: 'homes#index'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :rants, :users, :sessions
end
