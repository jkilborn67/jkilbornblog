class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  # these methods are available to all controllers
  # we have to do the following to make them available to views
  helper_method :current_user, :logged_in?
  
  def current_user
    # set current_user only if not set
    @current_user ||= User.find(session[:user_id]) if session[:user_id]    
  end
  
  def logged_in?
    !!current_user   # returns true of false for current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to proform that action"
      redirect_to root_path
    end
  end
  
end
