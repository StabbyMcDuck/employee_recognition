# frozen_string_literal: true
Rails.application.routes.draw do
  resource :user_session, except: :show
  resources :users

  root controller: 'user_sessions', action: 'new'


  get '/administration' => 'admin#administration'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users/new", to: "users#new", as: "createuser"

end
