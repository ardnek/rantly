Rails.application.routes.draw do
  root 'rants#index'

  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'

  resources :users

end
