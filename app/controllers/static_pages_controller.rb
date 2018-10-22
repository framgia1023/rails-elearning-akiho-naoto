class StaticPagesController < ApplicationController
	def home
		if logged_in?
			@activities = current_user.feed.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
			@answers = Answer.where(lesson_id: current_user.lessons.ids)
			# answers = Answer.where(lesson_id: current_user.lessons.ids)
			# @learned_words = answers.collect{ |a| a.choice.correct }.count(true)
		end		
	end

	def about
		
	end
end
