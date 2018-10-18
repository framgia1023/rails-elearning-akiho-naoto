class Word < ApplicationRecord

	belongs_to :category
	has_many :choices, dependent: :destroy
	has_many :answers
	has_many :lessons, through: :answers

	accepts_nested_attributes_for :choices
	validates :word, presence: true, length: { minimum: 1, maximum: 50 }
	validate :check_box

	private
	def check_box
		if choices.collect{|c| c.correct}.count(true) == 0
			errors.add(:choice, "should have one checked")
		elsif choices.collect{|c| c.correct}.count(true) > 1
			errors.add(:choice, "should have only one checked")
		end
	end

end
