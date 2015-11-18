class User < ActiveRecord::Base
	before_save { self.email = email.downcase,
				self.username = username.downcase }

	EMAIL_MATCHER = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, uniqueness: { case_sensitive: false },
		length: { maximum: 255 }, format: { with: EMAIL_MATCHER }
	validates :username, presence: true, uniqueness: { case_sensitive: false },
		length: { maximum: 50, minimum: 3 }
end
