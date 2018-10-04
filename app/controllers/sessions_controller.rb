class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "Successfully Logged in!"
			redirect_to root_url
		else
			flash.now[:danger] = "Invalid Credientials"
			render "new"
		end
	end

	def destroy
		logout
		redirect_to root_url
	end

end
