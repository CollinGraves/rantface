Rails.application.routes.draw do
  root to: 'homes#index'
  match '/destroy_session', to: 'sessions#destroy', via: :get, method: :delete
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :rants, :users, :sessions
end
