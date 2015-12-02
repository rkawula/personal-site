class Post < ActiveRecord::Base

	def self.get_visible_ordered_posts
		Post.where(visible: true).order created_at: :desc
	end

	def created_date_readable
		created_at.to_formatted_s(:long_ordinal)
	end

end
