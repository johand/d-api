# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :characters, only: %i[index show edit update destroy]
      post 'characters/create', to: 'characters#create'
    end
  end

  devise_for :users,
             only: %i[sessions registrations],
             path: 'api/v1/users',
             path_names: { sign_in: 'login',
                           sign_out: 'logout',
                           password: 'password',
                           confirmation: 'verification',
                           unlock: 'unblock',
                           registration: 'register',
                           cancel: 'cancel',
                           edit: 'edit',
                           sign_up: '' },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               passwords: 'users/passwords'
             }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
