class Admin::WordsController < AdminController

	def new
		@category = Category.find(params[:category_id])
		@word = @category.words.build
		4.times {
			@word.choices.build
		}	
	end


	def create
		category = Category.find(params[:category_id])
		@word = category.words.build(words_params)
		if @word.save
			flash[:success] = "Added!"
			redirect_to admin_category_words_url(category)
		else
			@category = Category.find(params[:category_id])
			render "new"
		end		
	end

	def index
		@category = Category.find(params[:category_id])
		@words = @category.words
		
	end

	def edit
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
	end

	def update
		@word = Word.find(params[:id])

		if @word.update_attributes(words_params)
			flash[:success] = "Successfully Upadated!"
			redirect_to admin_category_words_url(@word.category_id)
		else
			@category = @word.category
			render "edit"
		end	
	end

	def destroy
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
		@word.destroy
		flash[:success] = "Successfully Deleted!"
		redirect_to admin_category_words_url(@category)
		
	end

	private
	def words_params
		params.require(:word).permit(:word, choices_attributes: [:id, :choice, :correct])
		
	end

end