module SessionHelper

    def sign_in(user)
        session[:user_id] = user.id
    end

    def current_user
			if session[:user_id]
					@current_user ||= User.find_by(id: session[:user_id])
			end
    end

    def signed_in?
        !current_user.nil?
    end

    def sign_out
        session.delete(:user_id)
		@current_user = nil
    end

	def signed_in
		unless signed_in?
			flash['is-danger'] = 'You must be signed in to access that page!'
			redirect_to sign_in_path
		end
	end

	def is_signed_in
		if signed_in?
			flash['is-warning'] = 'You are already signed in!'
			redirect_to user_path(current_user)
		end
	end
    
end
