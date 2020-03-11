class SessionController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        
        if user
            sign_in user
            redirect_to user_path(user)
        else
            flash.now['alert-danger'] = 'Wrong Username/password combination!'
            render 'new'
        end
    end

    def destroy
        sign_out
        redirect_to root_path
    end
end
