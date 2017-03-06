# frozen_string_literal: true
Rails.application.routes.draw do
  get 'password_resets/new'

  resource :user_session, except: :show
  resources :users
  resources :awards
  resources :admin
  resources :password_resets
  resources :admin do
    get :delete, on: :member
  end

  root controller: 'user_sessions', action: 'new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users/new", to: "users#new", as: "createuser"

  get "/awards/new", to: "awards#new", as: "createaward"

  get '/landingpage' => 'users#landingpage', as: "landingpage"

  get '/accessdenied' => 'awards#accessdenied'

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
end
