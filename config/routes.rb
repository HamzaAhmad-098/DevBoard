Rails.application.routes.draw do
  devise_for :users
unauthenticated :user do
  root to: 'devise/sessions#new', as: :unauthenticated_root
end
authenticated :user do
  root to: 'dashboards#user', as: :authenticated_root
end
  get 'dashboard/user', to: 'dashboards#user', as: :user_dashboard
  get 'dashboard/developer', to: 'dashboards#developer', as: :developer_dashboard
  get 'dashboard/qa', to: 'dashboards#qa', as: :qa_dashboard
  get 'dashboard/admin', to: 'dashboards#admin', as: :admin_dashboard

  resources :tickets
  root "home#index"
end
