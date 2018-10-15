class Admin::UsersController < AdminController

	def index
		@users = User.paginate(page: params[:page], per_page: 10)
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		flash[:success] = "#{user.name} is successfully deleted"
		redirect_to admin_users_url
	end

	def update
		@user = User.find(params[:id])
		if 	@user.admin?
			@user.update(admin: false)
			flash[:success] = "#{@user.name} is removed from admin"
		else
			@user.update(admin: true)
			flash[:success] = "#{@user.name} is added to admin"
		end
		redirect_to admin_users_url
	end

end	