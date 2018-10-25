
class CategoriesController < ApplicationController

	def index
		@lesson = Lesson.new
		@learned_category = Lesson.all.collect{ |l| l.category_id if l.user_id == current_user.id }.compact
		if params[:status] == "all" || params[:status] == nil
			@categories = Category.paginate(page: params[:page], per_page: 6)
		elsif params[:status] == "learned"
			@categories = Category.where(id: @learned_category).paginate(page: params[:page], per_page: 6)
		elsif params[:status] == "unlearned"
			@categories = Category.where.not(id: @learned_category).paginate(page: params[:page], per_page: 6)
		end

	end

end