class ApplicationController < ActionController::Base
  attr_writer :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  

  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  helper_method :current_user
end
