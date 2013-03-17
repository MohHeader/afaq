class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  
  
  protected
    def authorize
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    unless @current_user
      redirect_to login_url
    end
  end
end