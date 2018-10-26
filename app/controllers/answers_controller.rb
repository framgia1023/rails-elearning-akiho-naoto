class AnswersController < ApplicationController
	# before_action :check_answered, only: :create

	def new
		@lesson = Lesson.find(params[:lesson_id])
		@category = Category.find(@lesson.category_id)
		# @word = @category.words.first
		# @word = @category.next_word
		# @choices = @word.choices
		@answer = Answer.new
	end

	def create
		@answer = Answer.new(answer_params)
		@lesson = Lesson.find(params[:lesson_id])
		answer = Answer.where(lesson_id: params[:lesson_id], word_id: params[:word_id])
		if !answer.present?
			if @answer.save && !@lesson.next_word.nil?
				redirect_to new_lesson_answer_url
			else
				redirect_to lesson_url(@lesson)
			end
			
		elsif @lesson.result.nil?
			redirect_to new_lesson_answer_url

		elsif @lesson.result.present?
			redirect_to lesson_url(@lesson)
		end
	end

	private
	def answer_params
		params.permit(:lesson_id, :word_id, :choice_id)
	end

	# def check_answered
	# 	@lesson = Lesson.find(params[:lesson_id])
	# 	answer = Answer.where(lesson_id: params[:lesson_id], word_id: params[:word_id])
	# 	if !answer.nil?
	# 		render = "new"
	# 	end		
	# end
end
