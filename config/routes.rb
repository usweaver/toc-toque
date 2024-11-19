Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
   resources :chefs, only: [:show, :new, :create, :edit, :update] do
    resources :bookings, only: [:create]
   end
   resources :bookings, only: [:index, :show, :update]

  get "up" => "rails/health#show", as: :rails_health_check

end
