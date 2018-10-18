
class CategoriesController < ApplicationController

	def index
		@categories = Category.paginate(page: params[:page], per_page: 6)
		@lesson = Lesson.new
		@learned_category = Lesson.all.collect{ |l| l.category_id if l.user_id == current_user.id }.compact
	end

end