class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find(session[:username]) if session[:username]
    end
  
    def logged_in?
      !current_user.nil?
    end
  
    def require_user
      return if logged_in?
  
      flash[:danger] = 'You need to be logged in to perform that action'
      redirect_to root_path
    end
end
