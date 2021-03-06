class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :user_signed_in?, :current_user
  
  def user_signed_in?
    !current_user.nil?
  end
  
  def authenticate!
    if !user_signed_in?
      redirect_to root_path
    end
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by id: session[:user_id]
    end
  end
end
