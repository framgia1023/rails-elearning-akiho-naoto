class UsersController < ApplicationController
	before_action :require_login, except:[:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Successfully Registerd"
			redirect_to new_user_url
		else
			render "new"
		end		
	end

	def index
		@users = User.paginate(page: params[:page], per_page: 5)
	end

	def show
		@user = User.find(params[:id])
		@activities = @user.activities.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
		@answers = Answer.where(lesson_id: current_user.lessons.ids)
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "User Profile successfully updated"
			redirect_to @user
		else
			render "edit"
		end
	end

	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.following.paginate(page: params[:page], per_page: 5)
		render "show_follow"	
	end

	def followers
		@title = "Follower"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page], per_page: 5)
		render "show_follow"	
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
			
	end

	def require_login
		unless logged_in?
			redirect_to login_url
		end
	end

end
