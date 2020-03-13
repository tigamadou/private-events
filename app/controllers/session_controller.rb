class SessionController < ApplicationController
  
  before_action :_signed_in, except: [:destroy]
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])

    if user
      sign_in user
      flash['is-success'] = "Hello #{user.username}!"
      redirect_to user_path(user)
    else
      flash.now['is-danger'] = 'Wrong Credentials!'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
