class Post < ActiveRecord::Base

	def created_date_readable
		created_at.to_formatted_s(:long_ordinal)
	end

	def self.reverse_date
		Post.order created_at: :desc
	end
end
