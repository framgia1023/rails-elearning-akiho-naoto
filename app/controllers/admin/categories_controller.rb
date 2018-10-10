class Admin::CategoriesController < AdminController
	def index
		
	end

	def new
		@category = Category.new		
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Successfully Created!"
			redirect_to admin_categories_url
		else
			render "new"
		end		
	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def edit
		@category = Category.find_by(id: params[:id])
		
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			flash[:success] = "Successfully Updated!"
			redirect_to admin_categories_url
		else
			render "edit"
		end
		
	end

	def destroy
		category = Category.find(params[:id])
		category.destroy
		flash[:success] = "Successfully Deleted"
		redirect_to admin_categories_url	
	end

	private
	def category_params
		params.require(:category).permit(:title, :description)
		
	end
end