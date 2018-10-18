class Answer < ApplicationRecord
	belongs_to :lesson
	belongs_to :word
	belongs_to :choice

	def result_word(word_id)
		Word.find(word_id)		
	end

	def result_choice(choice_id)
		Choice.find(choice_id)		
	end
end
