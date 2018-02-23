Rails.application.routes.draw do
  resources :bills
  resources :bookings
  resources :tour_details
  resources :packages
  resources :drivers
  resources :feedbacks
  resources :states
  resources :buses
  resources :cities
  resources :charges
  devise_for :users , controllers: {sessions: "sessions", registrations: "registrations" ,passwords: "passwords"}#, controllers: {sessions: 'users/sessions'}
  
  root 'static_pages#home'

  get 'users/new'

  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contactus'
  get "/change_city" => "users#change_city"
  get "/change_price" => "bookings#change_price"
  get "/change_amount" => "bookings#change_amount"

  resources :bookings do
  member do
    get 'change_status'
  end
end
#   resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
