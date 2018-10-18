module LessonsHelper

	def result(lesson)
		choices = lesson.answers.collect{ |a| a.choice_id }
		Choice.find(choices).collect{ |c| c.correct }.count(true)	
	end
end
