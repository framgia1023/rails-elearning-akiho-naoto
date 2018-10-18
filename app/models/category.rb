class Category < ApplicationRecord
	has_many :words, dependent: :destroy
	has_many :categories
	#has_many :users, through: :lesson

	validates :title, presence: true, length: { minimum: 1, maximum: 30 }
	validates :description, presence: true, length: {minimum: 3, maximum: 250}

end
