class Admin::CategoriesController < AdminController
	def index
		
	end

	def new
		@category = Category.new
		
	end
end