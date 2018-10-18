class LessonsController < ApplicationController
	before_action :correct_user, only: :show

	def create
		@lesson = Lesson.new(lesson_params)
		if @lesson.save
			flash[:success] = "Successfully started!"
			redirect_to new_lesson_answer_url(@lesson)
		end
	end

	def show
		@lesson = Lesson.find(params[:id])
		choices = @lesson.answers.collect{ |a| a.choice_id }
		@score = Choice.find(choices).collect{ |c| c.correct }.count(true)
		if @lesson.result == nil
			@lesson.update(result: @score)
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
