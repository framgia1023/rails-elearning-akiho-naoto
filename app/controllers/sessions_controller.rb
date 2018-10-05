class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			login(user)
			redirect_to root_url
		else
			flash.now[:danger] = "Invalid Credentials"
			render "new"
		end
	end

	def destroy
		logout
		redirect_to root_url
	end

end
