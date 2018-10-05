module SessionsHelper

	def current_user
		User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	def login(user)
		session[:user_id] = user.id
		flash[:success] = "Successfully Logged in!"
	end

	def logout
		session.delete(:user_id)
		flash[:success] = "Successfully Logged out!"
	end
	
end
