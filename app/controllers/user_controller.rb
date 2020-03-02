class UserController < ApplicationController
    def new
        @user = User.new
      end
    
    def create
    @user = User.new(user_params)
    if @user.save
        sign_in @user
        flash[:success] = 'Welcome to Members Only!'
        # redirect_to posts_path
    else
        render 'new'
    end
    end

    private

    def user_params
    params.require(:user).permit(:username, :email, :password_digest, :password_confirmation)
    end
end