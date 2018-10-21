module WordsHelper
	def learned_words
			answers = Answer.where(lesson_id: current_user.lessons.ids)
			answers.collect{ |a| a if a.choice.correct == true}.compact
	end
end
