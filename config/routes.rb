Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"

  resources :events do 
    member do
      get 'rsvp'
      get 'cancel_rsvp'
    end
  end
  resources :users, only: [:show, :index]

  get '/user/:id', to: 'users#profile', as: :user
end
