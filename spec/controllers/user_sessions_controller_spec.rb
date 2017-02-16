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
    let!(:user) do
      FactoryGirl.create :user, password: password, role_type: role_type
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

      context 'with admin' do
        let(:role_type) {
          'admin'
        }

        it "redirects to user's profile" do
          post :create, params: params

          expect(subject).to redirect_to("/administration")
        end
      end

      context 'with guest' do
        let(:role_type) {
          'guest'
        }

        it "redirects to user's profile" do
          post :create, params: params

          expect(subject).to redirect_to(awards_url)
        end
      end

      context 'with non-admin' do
        let(:role_type) {
          'non_admin'
        }

        it "redirects to user's profile" do
          post :create, params: params

          expect(subject).to redirect_to(awards_url)
        end
      end
    end

    context 'without valid params' do
      let(:role_type) {
        FactoryGirl.generate(:user_role_type)
      }

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
    let!(:user) do
      FactoryGirl.create(:user, email: email, password: password)
    end

    # Callbacks
    before(:each) do
      post :create, params: { user_session: { email: email, password: password } }
    end

    it 'redirects to login page' do
      delete :destroy

      expect(subject).to redirect_to new_user_session_url
    end
  end
end
