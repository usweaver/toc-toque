Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
   resources :chefs, only: [:show, :new, :create, :edit, :update]
   resources :bookings, only: [:index, :show, :create, :update]

  get "up" => "rails/health#show", as: :rails_health_check

end
