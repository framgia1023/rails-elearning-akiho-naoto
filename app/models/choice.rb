class Choice < ApplicationRecord
	belongs_to :word
	validates :choice, presence: true, length: { minimum: 1, maximum: 50 }
	# validates :correct, presence: true
end

