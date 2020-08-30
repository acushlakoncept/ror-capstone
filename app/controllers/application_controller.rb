class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(username: session[:username]) if session[:username]
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'You need to be logged in to perform that action'
    redirect_to login_path
  end
end
