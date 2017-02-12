# frozen_string_literal: true

# Allow users to see their own profile
class UsersController < ApplicationController
  #before_filter :admin_only, :except => :show


   def new
    @user = User.new
  end


  def index
    @users = User.all
  end

 def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
      flash[:notice] = 'User saved successfully'
    end
  end


  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :roletype)
  end
end
