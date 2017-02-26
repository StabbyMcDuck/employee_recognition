class AdminController < ApplicationController
  #before_filter :admin_only

  def administration
    @user_select = User.where(:role_type => "admin")
    @user_select1 = User.where(:role_type => "non_admin")

  end

  def index
    @user_select = User.where(:role_type => "admin")
    @user_select1 = User.where(:role_type => "non_admin")
  end

  def destroy
    @user_select.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def



  def list
    @users = User.all
  end

  def edit
    @getUserAdmin = User.find(params[:id])


  end

 def update
   @getUser = User.find(params[:hah])

   if @getUser.update_attributes(user_params)
      redirect_to :action => 'administration'
   else
      render 'edit'
   end
end

  private


  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :role_type)
  end

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end


end
