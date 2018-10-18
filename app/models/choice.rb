class Choice < ApplicationRecord
	belongs_to :word
	has_many :answers
	has_many :lessons, through: :answer
	validates :choice, presence: true, length: { minimum: 1, maximum: 50 }
	# validates :correct, presence: true
end

