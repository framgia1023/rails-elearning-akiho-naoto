module AnswersHelper
	def answer_correct?(choice)
		if choice.correct == true
			"◯"
		else
			"×"
		end
	end
end
