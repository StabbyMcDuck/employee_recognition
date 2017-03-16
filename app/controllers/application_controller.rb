# frozen_string_literal: true

require 'access_denied'

# Base class used for other controllers.  Add methods that need to be on all controllers to this class
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user_session, :current_user

  rescue_from AccessDenied, with: :render_access_denied

  def render_access_denied
    respond_to do |format|
      format.html{
        render template: 'errors/access_denied',
               status: 403,
               layout: 'error'
      }
    end
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    session = current_user_session

    if session
      @current_user = session.user
    else
      @current_user = nil
    end

  end

  protected

  def handle_unverified_request
    # Destroy session, redirect
    current_user_session&.destroy
    redirect_to root_url
  end
end
