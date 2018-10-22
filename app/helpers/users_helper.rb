module UsersHelper
	def action_user(user)
		if user == current_user
			"You"
		else
			user.name
		end
	end
end
