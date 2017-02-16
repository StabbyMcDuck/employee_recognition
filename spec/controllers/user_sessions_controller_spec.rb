# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UserSessionsController do
  describe 'GET new' do
    it 'assigns @user_session' do
      get :new

      expect(assigns(:user_session)).to be_a UserSession
    end

    it 'renders the new template' do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    let(:user) do
      FactoryGirl.create :user, password: password
    end

    let(:password) do
      'password'
    end

    context 'with valid params' do
      let(:params) do
        {
          'user_session' => { 'email' => user.email, 'password' => password }
        }
      end

    end

    context 'without valid params' do
      context 'with unregistered email' do
        let(:params) do
          {
            'user_session' => { 'email' => 'unregistered@example.com', 'password' => password }
          }
        end

        it 'renders new template' do
          post :create, params: params

          expect(response).to render_template('new')
        end
      end

      context 'with incorrect password' do
        let(:params) do
          {
            'user_session' => { 'email' => user.email, 'password' => 'bad_password' }
          }
        end

        it 'renders new template' do
          post :create, params: params

          expect(response).to render_template('new')
        end
      end
    end
  end

  describe 'DELETE destroy' do
    # Lets
    let(:email) do
      'email@example.com'
    end

    let(:password) do
      'password'
    end

    # Let!s
    let(:user) do
      FactoryGirl.create(:user, email: email, password: password)
    end

    # Callbacks
    before(:each) do
      post :create, params: { user_session: { email: email, password: password } }
    end

    it 'redirects to login page' do
      #delete :destroy

      expect(subject).to redirect_to new_user_session_url
    end
  end
end
