class AdminController < ApplicationController
  #before_filter :admin_only

  def administration

  end

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end


end
