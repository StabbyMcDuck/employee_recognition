# frozen_string_literal: true
Rails.application.routes.draw do
  resource :user_session, except: :show
  resources :users

  root controller: 'user_sessions', action: 'new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
