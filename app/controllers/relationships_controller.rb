class RelationshipsController < ApplicationController

	def index
		@user = User.find(params[:id])
		@follower = @user.active_relationships
		@follwer = @user.passive_relationships
		
	end

	def create
		@user = User.find(params[:followed_id])
		current_user.follow(@user)
		# current_user.acitvities.create()
		relationship = Relationship.find_by(follower_id: current_user, followed_id: @user)
		# Activity.create(user_id: current_user, action: Relationship.find_by(follower_id: current_user, followed_id: @user))
		relationship.create_activity(user_id: current_user.id)

		respond_to do |format|
			format.html {redirect_to @user}
			format.js
		end	
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		# Activity.find_by(action_type: "Relationship", action_id: Relationship.find(params[:id])).destroy
		current_user.unfollow(@user)


		respond_to do |format|
			format.html {redirect_to @user}
			format.js
		end		
	end
end
