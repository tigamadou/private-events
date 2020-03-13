class UserController < ApplicationController
  
  def new
    
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @prev_events = current_user.attended_event.previous_events
    @upcoming_events = current_user.attended_event.upcoming_events
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
