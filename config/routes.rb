Rails.application.routes.draw do
  devise_for :users
  resources :tickets do
    member do
      patch :verify
    end
  end
  root "tickets#index"
end
