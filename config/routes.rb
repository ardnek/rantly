Rails.application.routes.draw do
  root 'rants#index'

  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'
  get '/sign-out' => 'registrations#destroy', as: :signout
  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/search' => 'rants#index', as: :search

  # using authentication or sessions controller for sign-in

  resources :users
  resources :rants

end
