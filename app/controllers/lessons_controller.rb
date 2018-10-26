class LessonsController < ApplicationController
	before_action :correct_user, only: :show

	def create
		@lesson = Lesson.new(lesson_params)
<<<<<<< Updated upstream
		if @lesson.save
=======
		lesson = Lesson.find_by(user_id: current_user, category_id: params[:category_id])
		if lesson.nil?
			if @lesson.save
			flash[:success] = "Successfully started!"
>>>>>>> Stashed changes
			redirect_to new_lesson_answer_url(@lesson)
			end
		else
			redirect_to categories_url			
		end
		
	end

	def show
		@lesson = Lesson.find(params[:id])
		choices = @lesson.answers.collect{ |a| a.choice_id }
		@score = Choice.find(choices).collect{ |c| c.correct }.count(true)
		if @lesson.result == nil
			@lesson.update(result: @score)
			# Activity.create(user_id: @lesson.user_id, action: @lesson)
			@lesson.create_activity(user_id: @lesson.user_id)
		end
		# @words = answers.collect{ |a| a.word_id }
		
	end

	private
	def lesson_params
		params.permit(:user_id, :category_id)
		
	end

	def correct_user
		lesson = Lesson.find(params[:id])
		unless current_user == User.find(lesson.user_id)
			redirect_to categories_url
			
		end
		
	end
end
