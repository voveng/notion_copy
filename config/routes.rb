# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages do
    post :sort, on: :collection
  end
  resources :workspaces do
    get :switch_to, on: :member
  end
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get 'sign_up', to: 'users#new', as: :sign_up
  post 'sign_up', to: 'users#create', as: :create_user
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create', as: :createsession
  delete 'logout', to: 'sessions#destroy', as: :logout
  root 'pages#index'
  get 'home', to: 'home#index'
end
