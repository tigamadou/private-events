class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: params[:session][:id]) if session[:user_id]
  end

  attr_writer :current_user

  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end
end
