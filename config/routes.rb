Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :attractions

  get '/signin' => 'sessions#new'
  delete '/signout' => 'sessions#destroy'
  root 'general#index'
  post "/rides", to: "rides#create"
end
