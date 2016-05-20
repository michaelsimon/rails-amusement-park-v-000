Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :attractions

  get '/signin' => 'sessions#new'
  root 'general#index' 

end
