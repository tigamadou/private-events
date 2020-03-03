class SessionController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])

        if !user.nil?
            sign_in(user)
            redirect_to user_path(user)
        else
            render 'new'
        end
    end
end
