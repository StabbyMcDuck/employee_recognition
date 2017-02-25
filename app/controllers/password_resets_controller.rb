class PasswordResetsController < ApplicationController

  def user_params
    if params[:user]
      params.require(:user).permit(:user, :name, :email, :password, :password_confirmation)  # TODO minimize when update is working 
    end
  end

def create
  user = User.find_by_email(params[:email])
  user.send_password_reset if user
  redirect_to root_url, :notice => "Email sent with password reset instructions."
end

def edit
  @user = User.find_by_password_reset_token!(params[:id])
end

def update
  @user = User.find_by_password_reset_token!(params[:id])
  @user.update_attributes(params.require(:user).permit(:password, :password_confirmation))
  if @user.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, :alert => "Password reset has expired."
  elsif @user.update_attributes(user_params)
    redirect_to root_url, :notice => "Password has been reset!"
  else
    render :edit
  end
end
end
