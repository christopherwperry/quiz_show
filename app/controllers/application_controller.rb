class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    # User.find(session[:user_id]) if session[:user_id]
    current_user ||= User.find(session[:user_id]) if session[:user_id]
    # User.find(session[:user_id]) if session[:user_id]
    # current_user = User.find(session[:user_id])
    # User.find(session[:user_id])
  end

  helper_method :current_user

end
