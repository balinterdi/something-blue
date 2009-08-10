# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation

  helper_method :current_user, :logged_in?

  def current_user_login
    request.session[:user_login]
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.by_login(current_user_login)
  end

  def logged_in?
    !!current_user_login
  end

end
