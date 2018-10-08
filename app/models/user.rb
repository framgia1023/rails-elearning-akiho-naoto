class User < ApplicationRecord

	mount_uploader :picture, PictureUploader

	before_save { email.downcase! }
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true, length: { minimum: 3, maximum: 30 }
	validates :email, presence: true, length: { minimum: 5, maximum: 50 }, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false}

	has_secure_password
end
