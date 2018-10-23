class WordsController < ApplicationController
	def index
		@answers = Answer.where(lesson_id: current_user.lessons.ids).paginate(page: params[:page], per_page: 5)
		# answers = Answer.where(lesson_id: current_user.lessons.ids)
		# correct_answers = answers.collect{ |a| a if a.choice.correct == true}.compact
	end
end
