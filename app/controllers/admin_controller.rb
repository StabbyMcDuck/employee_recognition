class AdminController < ApplicationController
  #before_filter :admin_only


  def index

    @user_select = User.where(:role_type => "admin")
    @user_select1 = User.where(:role_type => "non_admin")

    if params[:options] == 'kudos'
      @award_select = Award.where(:award_type => "Kudos")
      respond_to do |format|
        format.html
        format.csv { send_data @award_select.to_csv }
      end
    elsif params[:options] == 'eom'
        @award_select = Award.where(:award_type => "Employee of the Month")
        respond_to do |format|
          format.html
          format.csv { send_data @award_select.to_csv }
        end
    elsif params[:options] == 'eoy'
          @award_select = Award.where(:award_type => "Employee of the Year")
          respond_to do |format|
            format.html
            format.csv { send_data @award_select.to_csv }
          end
    elsif params[:options] == '1'

      @awardss = Award.where('grant_date > ? AND grant_date < ?', '2017-01-01', '2017-04-01')
          respond_to do |format|
            format.html
            format.csv { send_data @awardss.to_csv }
          end
    elsif params[:options] == '2'
      @awardss = Award.where('grant_date >= ? AND grant_date < ?', '2017-04-01', '2017-06-30')
          respond_to do |format|
            format.html
            format.csv { send_data @awardss.to_csv }
          end
    elsif params[:options] == '3'
      @awardss = Award.where('grant_date >= ? AND grant_date < ?', '2017-07-01', '2017-09-30')
          respond_to do |format|
            format.html
            format.csv { send_data @awardss.to_csv }
          end
    elsif params[:options] == '4'
      @awardss = Award.where('grant_date >= ? AND grant_date <= ?', '2017-09-01', '2017-12-31')
          respond_to do |format|
            format.html
            format.csv { send_data @awardss.to_csv }
          end
    elsif params[:charts] == 'award'
      @awardtype = Award.all
    elsif params[:charts] == 'grantees'
      @awardgrantee = Award.all
      @users = User.all
    elsif params[:charts] == 'time'
      @awardtime = Award.all

    end
  end



  def create
  end

  def destroy
    @user_select.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete
    @getUserAdmin = User.find(params[:id])
  end

  def edit
    @getUserAdmin = User.find(params[:id])
  end

  def show
    @users = User.all
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
