class User < ApplicationRecord

	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "follower_id",
									dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :passive_relationships, class_name: "Relationship",
									 foreign_key: "followed_id",
									 dependent: :destroy
	has_many :followers, through: :passive_relationships, source: :follower
	has_many :lessons
	has_many :activities

	#has_many :categories, through: :lesson

	mount_uploader :picture, PictureUploader

	before_save { email.downcase! }
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true, length: { minimum: 3, maximum: 30 }
	validates :email, presence: true, length: { minimum: 5, maximum: 50 }, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	validate :picture_size #not "validates"

	has_secure_password

	def follow(other_user)
		following << other_user
	end

	def unfollow(other_user)
		following.delete(other_user)
	end

	def following?(other_user)
		following.include?(other_user)		
	end

	def feed
		following_ids = Relationship.all.collect{ |r| r.followed_id if r.follower_id == id}.compact
		feed_ids = following_ids << id
		Activity.where(user_id: feed_ids)
		#following_ids = "Select followed_id FROM relationships WHERE follower_id = :user_id"
		#Activity.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
		
	end

	private
		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, "should be less than 5MB")
			end
		end
end
