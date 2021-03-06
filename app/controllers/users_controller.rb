require 'access_denied'

class UsersController < ApplicationController

  #before_filter :admin_only, :except => :show
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :non_admin_only, only: :landingpage

  def landingpage
  end


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to after_create_path(current_user.role_type), alert: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

=begin
  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end
=end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    respond_to do |format|
      if @user == current_user
        current_user_session.destroy
        @user.destroy
        format.html { redirect_to new_user_session_url }
        format.json { head :no_content }
      else
        @user.destroy
        format.html { redirect_to '/admin', notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def admin_only
    unless current_user.admin?
      raise AccessDenied
    end
  end

  def after_create_path(role_type)
    if role_type == 'admin'
      admin_index_path
    else
      landingpage_path
    end
  end

  def non_admin_only
    unless current_user.role_type == 'non_admin'
      raise AccessDenied
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :role_type)
  end
end
