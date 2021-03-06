# frozen_string_literal: true

# Allow users to log in & out
class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new

  end

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:notice] = 'User session successfully started'
      if current_user.admin?
        redirect_to '/admin'
      else
        redirect_to '/landingpage'
      end
    else
      render action: :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
