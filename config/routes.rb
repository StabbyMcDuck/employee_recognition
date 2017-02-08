# frozen_string_literal: true
Rails.application.routes.draw do
  resource :user_session, except: :show
  resources :users
  resources :awards

  root controller: 'user_sessions', action: 'new'


  get '/administration' => 'admin#administration'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users/new", to: "users#new", as: "createuser"

  get "/awards/new", to: "awards#new", as: "createaward"

end
