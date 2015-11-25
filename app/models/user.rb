class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_save { self.username = username.downcase }

	EMAIL_MATCHER = /\A.+@.+\..+\z/

	validates :email, presence: true, uniqueness: { case_sensitive: false },
		length: { maximum: 255 }, format: { with: EMAIL_MATCHER }
	validates :username, presence: true, uniqueness: { case_sensitive: false },
		length: { maximum: 50, minimum: 3 }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	
end
